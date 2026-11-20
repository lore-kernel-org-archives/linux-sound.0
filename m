Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176303;
	b=sNjes8rX8W3eLwIOWGRwHKt45r5Cfik2Kli9/g2RhWrQk2cvlR/ySvkRL8RbN5T3eT2y
	 i3a0rJg0oO9RAAwg0s6XDueYBPTWqow7t7o0L1e4TfB0FmqyuN0iY0dYJLSnQvJnh6ntc
	 KRmmATONKk/l5CslO1PBkgjnwY3qd1HOtb35ahnr5a536Lxp9A7f3nTMpEd/M1xcLiHQt
	 adrDPKtW/QkuXAXYL8Gavws9UltiEL9GWG52Rym0nHFFVPpRzINV4FEtKgmTVeHtdkQLi
	 PqMhnCmuWqqsMrLgDbdeZt9NKCDxsQAHBCCJEE5sLIYHX3VBsjVNuJ3uStae9DdZdLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176303;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=IvY1hLP95EjHzOsLzZ2ajvBN+SXpiOPy5hS27NuyjPc=;
	b=AsnqdaKPgQrAJ9wPfuXw6JbYqlnIBw+EMONbXvhefWFfOI/5Ubb1qRBmjHK+MGvgtDGL
	 Oey8pImTuvPoVwZCCk46dT0DycKxwXct01RZ8TU1v7TyxKu913Qk6jtOOhgLAI4bz2PfJ
	 wup7fzocUGX5iDOOQvZAIbft+BqT1wQDll5esfeOS3SqvM2I1Ln9fG+BGLcXSm9lCEFJh
	 Q3nwqzDYL8QfqmfEtmoP1OpxgsiO8mZ7CMZNf849j6qfgZbxlZZxduuNbAvdosx9wpkaj
	 O6njKbUPnGhFKmy7qrtX7LVjOFp+cDdJ++WnlAmeFJAN2cbGQXUbtkmq7VBUoId/ZxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kode54.net;
	spf=pass smtp.mailfrom=kode54.net;
	dkim=pass header.d=kode54.net header.i=@kode54.net header.a=rsa-sha256 header.s=fm3 header.b=NvZOfVbS;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=c9MNC4r4;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F3F60A2604
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 12:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97F3F60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kode54.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kode54.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kode54.net header.i=@kode54.net header.a=rsa-sha256 header.s=fm3 header.b=NvZOfVbS;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=c9MNC4r4
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id BF9CAEC09CB
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 07:05:01 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 20 Nov 2026 07:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1795176301; x=
	1795262701; bh=IvY1hLP95EjHzOsLzZ2ajvBN+SXpiOPy5hS27NuyjPc=; b=N
	vZOfVbSrbf4OP2EtYLlm/YfPiKJse5r0K+gf8jxM90q7VR2PpJYB9SSf0CmY3gNB
	/HHqZXIVRjbz956Oed9/G99KtAiLA7/cQEnTsMfjKJepLnOmwwFHcE3UKRbBkr/A
	K/jJnYx3uMEalFrHQMruljnOVDZrDhZobkXNO0G4xoeBdxq16TpwcN7IWJ8OnN87
	WwxjfXH+QrlfXcrFajOOeYGeDDobM/QZQLfGT/5cuyMP6uuYxNy8h00EfOYsQr4C
	14pmsF5Kzqm4VtDK0DhZMGqvhKFCcyndXvD0NjTdJ5AEv/hWUC6UyGW64CcCNyne
	vMhNgVQz38/AIn2E5melQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795176301; x=1795262701; bh=I
	vY1hLP95EjHzOsLzZ2ajvBN+SXpiOPy5hS27NuyjPc=; b=c9MNC4r4Xi7aRoPXl
	DlZ6Ftj00jdSDVvLbGyaXQ5AaLUiEODBoPAB8eoPa2TdXBfVL8yyUdE7pkLpNMUw
	4wjvdZw02+qjQGH9YR2mXRob1YBOidB3OIuwbvR5ljuqDUGNQmfJHG5qp6KeM02g
	XEtFzj91OVmoHUJ8zjK7yLF3hMhpSjjn42dpaIJYw1qfGzk2JuH3N3vrcHhbPjjg
	jor68u7MdN9XeyoDhQDc8qo6z5DaBqLb0eeDkfO1UBm6v6SXbYevkFGks+rNNLvU
	Cj1va75tvpWrGmOH0Yo81EEJeO2rjDl+AKhKoWKKAjClZIvKa4evqvPSDJ2/eO7j
	mQ6mA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kode54.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795176301; d=kode54.net;
	mf=PGNocmlzQGtvZGU1NC5uZXQ+;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:J24OdRpoizdD86aUks8RiGqvkic4mt/hoXeFMP5ONdGjDkb
	nWXqaXVglzzM+1kd7PRd2UFyyaAuNnzkbPqi5DSARv/Om2eIXtbSEbAWEPEHBQzZ
	2fPKeFlEqdIVQjiIRYwue6xLMhDNxVAkTOlG1ADZt50I6mLfznIP/8QJn1r75gj8
	vyLggFAde7gFxMDEAxkI2fot4n4jaqlR8sPXbwsy0RdFR6KHUsqP3T3nDoGTq5Wu
	+If6T7T77ZXNLJgqHg8JIDxf96fS53Fehna1CiLggDJXLOS70WoJKpTY7aTwoEDL
	wfLLFbAOEgKoS0LCiJxL+3IEH9EoTlmJbarD10Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tnget8bzA1wtbVudXG1sql83rQz4jvJy7h0+myWs4FI=:+UI3E3y/ALpPdOkM4mM2wvpUwmFS/shOCxCrDavlc0Q=;
X-ME-Sender: <xms:bTcAa73ahJFH9Wof3bb9LS_6vHMoSHpL7hlD3qzQAh0r2ixDpO8OtQ>
    <xme:bTcAazZgQMKihjHCxy4-GO7cN2mo8yn77qDEsZ-mPbPuwCY3AztzxAqw4khuS_-4Z
    XO0df2LZn31xtS3NUQQ5opxD1QwjhvJwpGkXTECzJqv2uhEesQdekg>
X-ME-Received: <xmr:bTcAazJKF3jmtovHLbOqGPsJiLCwEZ2aEgq4vep2BOoQnSKb4mxDHF-DPNU>
X-ME-Proxy-Cause: dmFkZTGYM6HqjTLSSesIS30/EoDENuBYYO94YU4vXAMBXU83exFX1gz7E4KOORT44T2x8T
    lMM4puhUWOMnOhFxfFwHVhBjNCBYCeIH5aLtzqLtDlJL9bQxBsP/m4UrUczPMNcdtuAcux
    xyL6WwQIeVuw5h9C0hYlBCvSdJCuv9v3DUS0ffwZLpWe+XfcrgK05gTjD7A/A5LmFDH8My
    gxKVtGmTSAaQLMuhAqTsUOKlBF4NebuvGzbnLyOxLFdBtL2aXj4DhqOgwG1xtdIMF5aNzH
    0qRFi+/bizwoqmXsCj9l28+OpAT1rB360V323CuUrlSxVYoc1LkzqDsmiHTD6kMXHJyyG7
    Av24QedGck2Mf+8fy9Ixlexhgb2Gmh0d0V6X9RoAcsyWA3VgtRiZWpa7G5x+XAgWL4wMB6
    UqlrfH4Kh3BP9QBmG4KhE0kKtqsCr50+okzDLCQelzRJJWIW7PCuQ0dnRZ9bESm0sb04XE
    NZ/CUQdAdr1UvKe7qC8n/eMOfuStXjfJfd1iIJMPIjCf12jSUWrGuj889zITaT2mRsHn+k
    4y8MV9F55BV6msGEOfMlhD69sud/5+C0ByyeWtEWI25comi43LYOYBpCKgXcnq3Ewu8NED
    62qxK5YsjUjiwM5h2RcWwwiWIqGVk16kgOK2J8J3clNPPxWERoVQ1ickDgoA
X-ME-Proxy: <xmx:bTcAayGi21_7aePJesG2LRhw1K9Aes23vlKLw__3xHfSwUz5rTpZbA>
    <xmx:bTcAa6skokbOq5u3MbmXbJrPnZg9GoIEEblbDOEKQU4BGlCSkT9rVA>
    <xmx:bTcAaxtDbdZQh2yt03VVAWVWGFe68VQZ17f97fOYo3pQ_nH3L9Xexg>
    <xmx:bTcAa4Cw96grql7lLXQ6LJEVCbMoOthAXuoiwOcocpkrBZzHOkQkJQ>
    <xmx:bTcAa0uc-ZSME4wwpV2PXAAXzG8NK5SyccTECphseX_Df28VyYP1LLk3>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 07:05:00 -0500 (EST)
From: chris@kode54.net
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Christopher Snowhill <chris@kode54.net>,
	Rong Zhang <i@rong.moe>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: usb-audio: Add quirk flags for Logitech PRO X 2 LIGHTSPEED
Date: Fri, 20 Nov 2026 04:03:48 -0800
Message-ID: <20261120120356.10909-3-chris@kode54.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120120356.10909-1-chris@kode54.net>
References: <20261120120356.10909-1-chris@kode54.net>
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

The receiver of the Logitech PRO X 2 LIGHTSPEED headset (046d:0af7)
resets itself on ordinary requests such as SET_INTERFACE when it has
been hotplugged and not yet gone through a reset of its own. When the
probe-time interface setup runs shortly after configuration, the
receiver can instead stop answering control requests altogether until
its watchdog resets it about 77 seconds later, and the headset may not
pair afterwards.

Skip the probe-time interface setup, so that the first alt setting
change happens at stream open. The receiver still resets once there,
but re-enumerates within half a second and then works normally. Also
set IFACE_DELAY: the delay after SET_INTERFACE lets the receiver drop
off before the sample rate request is sent; otherwise that request is
in flight when the device disappears and the disconnect waits for the
control message timeout, delaying recovery by five seconds.

Keep CTL_MSG_DELAY_1M from the Logitech vendor entry, which a device
entry replaces.

A receiver that is present at boot is not affected.

Assisted-by: AI
Signed-off-by: Christopher Snowhill <chris@kode54.net>
---
 sound/usb/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index cff10fac496f..29523d2a99bd 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2284,6 +2284,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x046d, 0x0aba, /* Logitech PRO X Wireless */
 		   QUIRK_FLAG_MIXER_GET_CUR_OK |
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+	DEVICE_FLG(0x046d, 0x0af7, /* Logitech PRO X 2 LIGHTSPEED */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_SKIP_IFACE_SETUP |
+		   QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x0499, 0x1506, /* Yamaha THR5 */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */
-- 
2.56.0

