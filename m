Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.69.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526760;
	b=aSjiAiHd22kUNAe2RTlqJzimEZGdUZ2OrVGQlPTvZFSOT5HFS5EVjS0uuKRaP3SHXvfj
	 PAZq+LYj0r9kV8V+BxIP6gZULI8mQwBBuAF0czNYSmQgQt4nrpbdFRFQfkfJDnJ8gFyy1
	 eNRCnTnciocAG/J2qQGGlgUX9jl/NKj6GI+Q7HtC8eLuTmyDsqhbmolDtwy+NekZHCCdF
	 VqAOfUIUCS5y8xWJPKuLuM8jUo8+FMc632Yp0OOwyAcxbu6SN2zq60t9B5UdsxVZ4txX8
	 K4Vwe5QGA7YzbCUJyE2eTG4Jo5YTdC/ZwiyE9e52LHdQh/OfK8gR7qy8HXgzwhadrvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526760;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=uJ8EU00/Q+b+/YvGzDSkukJ5q7wWpoqF/vo/1ezwyLY=;
	b=49cXjIiPvcS3zRjXcLghduYgAwjNgiZ0vCGfFztRjTEw0jBZHyjo+WUdaAPVXocyFpS8
	 1xOzq/a76vlzIpmMJuS1oe+VRYr9HEEsu3I83tTgpigMCTmT8ElztiGtReexmDMAcYorM
	 wVu115ELNr5hkKsrEd7CCgyqFfJN1afhIOfV+GNGUeJTTouX/VVC4C/Erlo/zkiSSQIer
	 +I4YpnOmDyQaU/z5xhnu7+8RFCQ7UQuWLM357+xWXWFy4W/lQ24y2e/PLyGZP6ubfFMB7
	 jNlKGkcQS8UXx+4SF957eZ13PIGvQ8CV0r5abc4NSyQE+74NTTbq+KFjmFVQh26Bc9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ynnk.dev;
	spf=pass smtp.mailfrom=ynnk.dev;
	dkim=pass header.d=ynnk.dev header.i=@ynnk.dev header.a=rsa-sha256 header.s=sig1 header.b=ddv5sYZY;
	arc=none smtp.remote-ip=57.103.69.227
Received: from outbound.mr.icloud.com (mr-2004h-snip4-6.eps.apple.com [57.103.69.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2E4606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 13:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ynnk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ynnk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ynnk.dev header.i=@ynnk.dev header.a=rsa-sha256 header.s=sig1 header.b=ddv5sYZY
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPS id 8BD951800293;
	Tue, 24 Nov 2026 13:25:58 +0000 (UTC)
X-ICL-RepId: 01a20dbc-1072-7eeb-b7e8-538669af52eb
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynnk.dev; s=sig1; t=1795526758; x=1827062758; bh=uJ8EU00/Q+b+/YvGzDSkukJ5q7wWpoqF/vo/1ezwyLY=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=ddv5sYZY9TdsNnUsmhmdvdt+SP/9FNmeQbhQYMbQuWeCrxYnWjAD45oXVJ/lhjTXtbBks5nno/Vjqs2US/xOQT1fayJY6QauqB70QraaRumaAhBGoTqMP+Z6BOfM//DNuVSlWkuZaVTYbFwfVZcYModW+AnKTmjHK9rXLWkI4yN6omyFYKIiva4+1EACCkYYUajuVAkaAtXjZF42x3lGXo8b3TSv2sADM1qDuktsuvUYFltFqHOAMON64308IccghaERJQZMrmMSfG328WNrDlhPgQcbjt3nNkqb0bQlAIvx4oRQ9wQxQUAGwXMn5tH1/zV/3zOWT06MR9ynPoTG2A==
mail-alias-created-date: 1686161252489
Received: from notyourlaptop.clients.bit.guest.onway.cloud (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPSA id 1F3BE1802B62;
	Tue, 24 Nov 2026 13:25:56 +0000 (UTC)
From: =?UTF-8?q?Yannick=20M=C3=BCller?= <mail@ynnk.dev>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	=?UTF-8?q?Yannick=20M=C3=BCller?= <mail@ynnk.dev>
Subject: [PATCH 0/2] ALSA: usb-audio: Limit recursion depth when walking audio units
Date: Tue, 24 Nov 2026 14:25:49 +0100
Message-ID: <20261124132551.137134-1-mail@ynnk.dev>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfXyjeEkD6CZA4R
 W2vVUz6z7fIK019IqoLdFxP38e8C9HEfp4+rvgYlf3eSM2zZpB8jBfFSvv0alS+zEEapedor+/w
 LIYXbTosFtpppthMAEpAkg7PliZ7XR6r8mmG4+NRPMBCihSREjlmq3Iy7fj1ectkZSuWJCn8WpP
 lZFfnQKUsLHdG1+Vb4e3jS5kik39sOmCvSuBpN08EFqSsAWuBRlXi+sSzcgp9Q4UOmIlhJABBWr
 iw27U/55kLKLOYqXoN9CMpXYZN6FSlN2pAitdAwdRMNibRqrfNhSKP8VQqxSZrNLwuq//vXcuCc
 zewn9DsLw+DCM4dpEFtBAthrDIOLz6aBDYliVhGGXUCsd0c4mp/Ah1L0ywkDyQ=
X-Proofpoint-GUID: Up3TgNB_uJcGdhMFL9DRKJ0RX1-1Hb7G
X-Authority-Info-Out: v=2.4 cv=B/osQ+tM c=1 sm=1 tr=0 ts=6b059066
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=fajnDIswKVxD1YtQT70F:22
 a=MUMyTuqJ5fOr1Nv7BSmb:22 a=sNZXxMez_iTWdIYYgzEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX2Vu+Z0ub1gqY
 paAaLQ5DW+97GG1OgHTUP/lqJW1ElDbVS12L7sh62+XgtojyizNOJnyLNfsw5QaXqCvyxavzu69
 YpW3N9uMAG2Hni1ht14a8hp9OwN7dPU=
X-Proofpoint-ORIG-GUID: Up3TgNB_uJcGdhMFL9DRKJ0RX1-1Hb7G
X-JNJ: AAAAAAABzgJO1Zds9naO1hAPyK11kycv2ih2AKrKbi9CwnWZzaVhvUtdLjCKCqMDYFYyZM
 FgjpPdl3yGx5zQS53QLK6okOb+Qk7wNjotLm800hz/Uoyqn8qauEIktowrL2A1iJc515+B
 PaWftfsFESNtRSZR1jhRw14EaG3xGAdRJUpYJKnHar89q70dIlWhSTLRyOmf7HB3DsWR56
 6N+krD6h8z66/Vk4s62IrbhLh+l8Z4j1S/Dyoqun7/GqAiiORa5TpFeW6K5g5jgqrYFYSH
 b/UY5hn86hVmuhcYsmHx4fsPZTVAhcCHQAUKlWTZY2XAPYfM8OhG9k/8Z7bN6hsZAnwlle
 IptKtKyHfU7JRqLIbbnI91GpFdwwLVzCC2fUFoAjGHuVYNn92pJCsWvoDrGxSy1ThSLlKV
 pO49FZBlcxuN7LxssT7FfiFzze9YCotUf85So+Oo2bj/9k+gkAsdZJ/qEPJa2YfCCsmsiF
 I6RnF1uQxB9l/UoJC7nh/GLKEqKDWEfQIcyvW32DsJS/3LYVAi9noXPPiyHRcRQr/GGsBS
 WT0K7mxLOitnDwe+Vsc8HjDPOl1lEi0cVXdue68ID2u5w/BMYqfRGANNtN/5PRWowPSm4J
 pZscvPxmyOjfzN/s+1i/EwbTFi68oz4NZgl1Vp9RV+AwDO4TBXeqA4nxIQB7kN4fTCcqSq
 +sY7eTHrGjs3fmm8V4zXa5AKhC3FNuk0uD/IC5p0GKLfnUu7DfLPjEO11ShuP1zQC1DwGy
 wQ76R5CpKkXih3meV/oLHDtYjjTZO/Cg4bgZZgc8YCv9MyxI/7j0qv/zrL6kmmGq1UB9Kn
 esesxnCmonv7D3HTzQEDgf0FwPCkY89onpS+VY+mRVV6fSS44L8Uv5Oks3DIYj6uUDxLYx
 KRat0+cUebQIfzCOnetYYgxeHmnM1dJEl8Ip+MoFUCO4Kp8RhnxNRX9NF/tf6SSRvOBn+r
 LcuCAqifRtZVCerne/JN8C3Y6gWy4cuKwsSk8qv4yiJUbNndDoJMqcahTeerfuTi7uwg3n
 BohPvDw+YIM4AuOBoyae2xERA1EDgJ1HoAICaTA2Gk9/WWHD92BhpTLWlnGsMhtB/RNyok
 Nf6VJgjWGfZdeHTvnwKxmmamLQ9YmSQ6Ej1BFHgSX2cuNtwqFsu1ruzs6OwmGFSwIDoHSJ
 1LSB+bR8XDma/hNuPyUF4f/ptTt434Gevk9OoUfqtnLXqmrHkuNiWTi0skc361aOPV91z5
 OUOSibfXmO2QyXZTs3jqLlo2bA9pHBbnmFY=

Fix a bug that makes it possible to overflow the kernel stack by
specifying a long chain of unique nested audio units. The current
implementation lets an external device specify up to 255 audio units,
which results in a stack overflow, as walking through all of them
recursively leads to too many nested calls.

Limit the recursion depth to 16 nested units so that a device can no
longer exhaust the kernel stack with a long chain.

Yannick Müller (2):
  ALSA: usb-audio: Limit the depth of the clock topology walk
  ALSA: usb-audio: Limit the unit nesting depth in the mixer parser

 sound/usb/clock.c | 20 +++++++++++++++-----
 sound/usb/mixer.c | 25 ++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 6 deletions(-)


base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.47.3

