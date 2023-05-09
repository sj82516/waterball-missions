require_relative './domain/card'
require_relative './domain/big_2'
require_relative './domain/player/human'

def main
  big2 = Big2.new([
    HumanPlayer.new,
    HumanPlayer.new,
    HumanPlayer.new,
    HumanPlayer.new,
  ])

  # 手動塞牌
  card_strs = "S[8] S[9] S[3] D[J] S[7] H[3] C[2] C[9] H[2] D[7] S[K] C[6] C[3] D[4] H[7] C[A] D[A] D[K] H[4] D[8] C[4] H[10] H[A] S[10] H[Q] H[5] S[4] D[5] H[9] H[8] C[10] S[6] S[A] D[3] S[5] D[9] D[Q] H[K] C[Q] H[J] D[10] S[2] H[6] C[K] S[J] C[7] S[Q] D[6] D[2] C[J] C[8] C[5]"
  cards = card_strs.split(' ')
                   .map { |card_str| card_str.match(/(.*)\[(.*)\]/)[1..2] }
                   .map { |suit, rank| Card.new(RANK[rank.to_sym], SUIT[suit.to_sym]) }
  big2.init(cards)

  # 正式開始
  big2.start
end

main
