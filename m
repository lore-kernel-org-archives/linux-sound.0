Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590617;
	b=GTRQjSNUlrLM8cmIGFGf8vhBvMe6JUBjzqIAZ/bNP38AyS+gd4sZdufYQ8U16sFuQhE/
	 dFYKNvIv58hVw+VuJIpH3FbeLHWcnpBRJ6gEwt2mSEZM2EtTe413zctDzpdUQTQiGMlQC
	 V+WLqaUdFdxQIt9fzaWhW2Afdtb3Jlv46EAID7KySJrkNucaqYPkKZ+lUYAeHZ/wVRn2i
	 vAVKXrR+W1/CSDYV8HkOsv5vWmlcahk+ywvF92Izhhl4KZHqouwqXzGV9NKnsfKMOeD2O
	 YMSvndoi8/Q8sGtz31dMHcpAs/4NxRm7OqmA2as/x6VsScPehA/k+geF0qGtTrYU0vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590617;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lGH+2rzmuwvKXpRB2Paj80a1EoaNN9qQuK8I+Y1PBYw=;
	b=JxGhSMdnwTHGnjyghAXlJpjix9+sJAgvkFAZ1qkHCNoiGn9+IH3ppz5ZzvsubSWnz736
	 pd+ANQTyUv4QkXRm/6hoICq7jHAMAOi9qh2UST+95q2r28BTNj7aFH1r4lM6LswOLTedH
	 Mk13okFo/gSJ3sC2Hhh07dqe6NPLWx+hUy+U2kpYVvYxh8X5X76g8UxJZ2X5m648Z2Eqq
	 9IXskEMuFld9TQacGpyDuisLI6n9te978nwyzIbAN5U4cyoJPP3w1rISUpmHXsD1+PDIH
	 QC6Oaz1k5cntkHpw9kGGAGIPLonZ3XKlR7PbaZ+okEXtzPTrWERuCCa3kI9MTpJO7Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=fFY+PqYn;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MQIjct2J;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119E5606A335
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 03:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 119E5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=fFY+PqYn;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MQIjct2J
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 699FD7A01CF
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 22:36:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 01 Nov 2026 22:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1793590616; x=1793677016; bh=lGH+2rzmuw
	vKXpRB2Paj80a1EoaNN9qQuK8I+Y1PBYw=; b=fFY+PqYncTLpp0rNtb4CIHOhQo
	PEqHMUL8NxKuhBSna8MNVa4eZX5JyAc7ifmZgGh5ciXQvndaUyPu8qETwkBEmKuP
	yEOqpjQ3ZtLIfrdrg0/nmfvrqZOUApXgJkCaXonfIqI+ANfDRLLWDwoZkwc/jRJy
	FAu6/Ooj3t5U6FMpGhrxJ7cIbS6K3ZPUZ0C5iC7CPs9loD2eOLfx/hpaLIGNjPcG
	4X8TgX5TM6OYsgzMJEhd5i/6nhOG92h24eoLEWYCi3uM9iGBj2LV6M48Ef+0ZgTo
	eC4jZ6auZCKiFnavNWGQFWbdpGd6UqqKf1cPjSeewpNesFi+7b/P7NjxEKxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793590616; x=1793677016; bh=lGH+2rzmuwvKXpRB2Paj80a1EoaNN9qQuK8
	I+Y1PBYw=; b=MQIjct2JW9eKPx3DaihRk4CyGciPXhxXtuQIIHkLTEd3TTuLbFa
	1qGUFWjkPHQ7MwRmXnj0VmC3ElJVn7g61tupex0fBtHD9vjxVH2LX7cJmCLxt0vL
	oJEcbuBpthjX8hBgC8KtBfLl6ufZ41yXmqKP5+xFe17928HNjygK7MmaYfvH2/6+
	JN/uDylrj5C4qbt+RxPBeiojV2GcSdq93Pz7IBu03Sl8JItmnZ8YqjoEpJoLIyv9
	+qGI5QLFL8EuoTO4NrGDMiuVzWnT1iNNtVc2v8GtvKQXncWtsxuv9yJt4cG/dHcr
	OboBTxAHuERrCFeadK3HnaRNda83mavvLjA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793590616; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:IZeh2YxY1RyuoFuKCeLMpZv1ahTOly07UnkjIjm90aBfPFJ
	ezGOFY1JpAVKbTivlwzqcpDLLmaalkOdcjmYkOyMEwshvAZbEvC9NAoJI3aFFQU5
	MTl+hUBsU2VHjuPbvJlIPjtydqNtQPWrUlc1joa/tec9R6N+5BCGFAN4at1wkhB+
	TEE6ezqLU91Ppn1XSoiGVck9+veLPprq87yuHyr97y6asO+IcRc6T0wUDGvCmzGC
	hwhtsVGOaEj0dvngv8ZL1WHs+zcXXByX5JInAFKKVcHcfQ5mTTttgfY2yGuTpeT4
	xNfDefESGFaSG0vZWS2E6C2tms79/+m1XqOr7IA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:OLwN8m+71vHsXO2AX6neTXOCKPrARqmXeRrjXR2bm+E=:ZhqIlmpr98cFfNr7lkRR+HYyag0GYpMyxJiJFwvNoA8=;
X-ME-Sender: <xms:VwXoas8-iB1dbYatQYSusCHSbuSc_5cNWYV0xCeLYIyZ4pekStrazw>
    <xme:VwXoasc7D01MLcAiXq-UACfF_VyV9OFboOKWvhEzWc9jOvGqIixoJCcMreeVmBP1a
    pqJpTEBD9-FGz0pyk3-gWuNcYGenQBESIycVVVdvvAeM3SiOsG5pHtM>
X-ME-Received: <xmr:VwXoalG5BpejkfLZhiANnIvhmUk5q7FUtYzO4tHYOagiBEeZRgfMq2HK6tkMHZZ-QwgdBqT1iIssf3I8ILpep0XtQlLs4fj2a-oPEceVEv0P8w>
X-ME-Proxy-Cause: dmFkZTEEFqkTvuqpgQvGmJRdNCy23TXEZ8CExyeeatrYT8OhphRUDKMvOEuU9aKBpC3TWV
    o8RQqIxHhDrE+ZnGh12AW3wSDpERvsDPzFfAgxn7ThCTJMFDBZ5gBpUteCTXAc+j9f4uec
    8DANBwiPlAQyPRvOuIhs5hATyZn8+TmNFsYdzQUEC4uwks5lvdOO+US1xAuztuD52m2gbW
    cjeLZv2kaOx9Kuzfskd3KDhTps7oJUmoCu4vorZYoCF1j3gnjTO6KesBHXHSwjJKyrI7zn
    StJLGT0jduDI5EIsXSlaXhf6SzWys4FQRlMaDeQFRDn5wU3AsCheDiW+MHMilM9yl/UcNR
    2v31Q00gNIJaGgaFqYqXAFK5d1n+V/IY4Uyk5HG2mqYSbTxR5KcRn+Fb+rbbUOttyNk8Pi
    gQCRtfGHhNd9gkmRO6G68eyzcYnh+5jSgKJ5gkAEd4iH61YHe/nGmDBOV/sDfjKPhsM4yN
    +XjLnUn5KnBU03X/tqqyle22x4Uak3SlQcc9NeVblzTdDB4+rc+88S1ASCanfgjuZV2PyR
    m6cmI4nZTWFSiCuITBIN8w5ts+QrAFyEeN4hWksIPLT6KiHIvTANAWounyXSTRFQRjwyXT
    jnyavP9VBodaumFCQYZQJ/7h7YLWPpFomV8nA0KxMPEaAs5e/we8aFEbiG8Q
X-ME-Proxy: <xmx:VwXoaqcumXccXaN7wQ4lGFpxosRSLzVs1_8HavBneuPIFWcZtOib-w>
    <xmx:WAXoavHw6c0rMC5mPflUH5Q2haIj4-UYWy2ijzaow4mJFOFiUlXCsg>
    <xmx:WAXoajXdblqvo2Jr270afnZTo4iWHLxi9RtF_wRqlyxQCMJJz6BIuQ>
    <xmx:WAXoamLbt2wfItTYlRdm4Q8NGU0yAEIgkp973z3h3_6hXeG51PQsoA>
    <xmx:WAXoagvdgHPaNQ6pTOPfLh_mEJK9RxoHGd_h9VL3pY7GLS98cQMaPQBI>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 22:36:54 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net
Subject: [PATCH] ALSA: firewire: fix inverted streaming speed between tx and rx streams
Date: Mon,  2 Nov 2026 12:36:52 +0900
Message-ID: <20261102033652.1184893-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ALSA firewire-tascam driver uses inverted streaming speed when reserving
isochronous resources between tx and rx streams.

Correct the streaming speeds. This has no impact on existing
functionality, as both streams are always reserved together when handling
PCM substreams.

Fixes: dbd0cf204fe6 ("ALSA: firewire-tascam: reserve resources for transferred isochronous packets at S400")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index 4ecd151a46c1..462766946e94 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -287,10 +287,10 @@ static int keep_resources(struct snd_tscm *tscm, unsigned int rate,
 
 	if (stream == &tscm->tx_stream) {
 		resources = &tscm->tx_resources;
-		speed = fw_parent_device(tscm->unit)->max_speed;
+		speed = SCODE_400;
 	} else {
 		resources = &tscm->rx_resources;
-		speed = SCODE_400;
+		speed = fw_parent_device(tscm->unit)->max_speed;
 	}
 
 	err = amdtp_tscm_set_parameters(stream, rate);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

