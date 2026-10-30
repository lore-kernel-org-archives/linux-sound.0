Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374929;
	b=m4WWiVxFKECcc6c3jKydZJ0yfN9S3CDkRi2iOChQHMlrR7LGZMHrAKB6EwsEnd49vgUE
	 3sLN6jE9YKbdPtmstOYRZ5pPjeeG7Vf3SkS0KlJqwfduP69SrOA2VVGG620UNYJw3cUT7
	 CAqLZ8HAOtbLmSyrvc4h43aA42PV94OoVGjFr7Hm03iwIST4cp06eXr3AZYgObkzgfw44
	 LcHl9gJ490hlB4knFeMvYNs9A8x4XoFOYoFC3qi+HLzFZDmF7KRz/tcloxNCw0nH2BC2T
	 Qn0W/r5EIX3zoQ0gY3EMxMwO17RoKBmVQwLeXNAUatHVpDgFb46/RzZX4K4n6ZvppGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CaT2SSAJFNm/sn1nl6FBs7/CABv+df9p8PrN4R09z7A=;
	b=3KWgHxfy7Sk6+QgSvO9nze7OrWwab9semX8sfozodXvmSjg/dgwIQ3eoir48LYJP9g7k
	 S2U6vlerIKlsjRdBy5pDIj7D55VFjAa5+SzvAxUmBwPly8L6CHagjril5HBWfy3laiDD+
	 mql2A39pLxNblibVSDaaAZSsmhxrc7bXiXxiGTTn/ZKTx6manb8MuzYu6oQJZxXaQs/P6
	 fSxG+sZcQ0BU/jBURjHUz8DxU3p+GGrILC5awDowL8aGc1BuhyJGwnEODmXsvl8LpD92L
	 2S7MT9UyPPZr2G51aqzTyRlYhLl9eqfE5WpxhM5JQfTCXIXipLki9OVs0nKzkkUosqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CjxFBs1f;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DE9606A31C
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 15:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19DE9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CjxFBs1f
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so10969475e9.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374928; x=1793979728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CaT2SSAJFNm/sn1nl6FBs7/CABv+df9p8PrN4R09z7A=;
        b=CjxFBs1fG3X4uRzTT8eoecv8f/WX8SMgh85KDlSg7FGUwToLmqADTyWEyVCdBUVXWc
         Gk38Vvphua4C2Gc5kOnWBJuJdfaIL4RO8y11hMUQs/n+vLduoOVqgv/sBugTk5ZtC0gg
         cWGhJyFzT3wSE1Kf5Nz0qGd+s5EPRdUfZvx+QPXcDxmGwNEj8Qd4IICN8rCdXdIcsQEh
         efCV9lOb/ti/q5G7Xbf7DT15MMmsqkp05KZiqo2KOMTLq9i6v4JdiB1YTDWjdSWgqOiF
         vjgQCIjX71cOuVKHmPe7RD/NFCJl0efYkQU/wsQ7JCon/JKBMBfxycdgpXfx8W40oeuw
         cOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374928; x=1793979728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CaT2SSAJFNm/sn1nl6FBs7/CABv+df9p8PrN4R09z7A=;
        b=TgoY28NU10tIcm1ptnWawsgmqRxh/Oz/xv8OIYAB8snJYFkW3Bfe4VHSHRuIFuvD3H
         9t5YQcuqtt7FPrwAGDMEk9OmQ/WP6MQjz4x0jZdF46LOftqWz46CSOGVsf0ilStGKBL9
         2/Ct0vSG25g3EwDaXOS8qEfi5YNRm2k+PxmpI4lvi7I/LHf9EZRimh3mCWmftCOVhwjA
         XcGu2yMGnOUV4Hy4QYeHFF6Ienjm0u3KrnVjwCXUIXseYoa0Dn4D3qdcVm0stcokwaqF
         HaD56DN4pIVmYOaHVKEasfGfsPUjHX9pRDd7UnJmGih2gKolrxxRXs8k11IAWyRKhk3D
         vy4A==
X-Forwarded-Encrypted: i=1; AKwUvBz/QLe+KV0xl8Rsliuyi/zXI/1e6L2TfEwBWxxMUpg12qmgzNwOMD8bBMi+ql3WJe3FRW1iJeEW3e2+ag==@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ5kgRyokk+TKClGv6hPq31TD6/X6myiJK8fgdn8lerl4x0biw
	UBaQldYDdxzkV/ruOcft8fEdn/MhSPovqQJKglvPkAjafBBer0pOzLo=
X-Gm-Gg: AYBFou1+tKPlIpqAXh/RY1pC7YQ/V3o0a9u/Zs+sgu9GZqFHyFktdLOJfcFcEkVNfWX
	qy7wSYixc9wXxVW8hRYNWsu5otaEaJ9LlwndJ5in7WxYU/JPZ8VeFevjat4SdpNV2O3i9tZSXTE
	GmicFO6PFT5kpPoL7vEWe0iQMDsF97VfOu+Cf6L3mpqaJvZLMy16+ZnL6iQYbCNJmx8Y6PG0+gD
	g+p96KYrREWyOttRcL3lmaq7OinQuPTFYfzYvPXX+GBvX9tWLNn5X0t2MxHN5q7ZWnjvHbD8FgV
	vUMOW0LFmYMisf2S/QJCvReBW1Y9dMVKxTWOWqfVBIjVrJrIN4DjIDHuACS/78aWrqsoqF+5FFp
	G27UM2la9pHOsTr0uV+noLYCp2U8RJZKej+iAE3Y7p4hl5o/iQI6nWKTo/bupZMWts24+95fT7x
	20c/hNjA3ylHbCNj/x2Mak54Ne8+MC7AlM4XnBAkUIP0EaJQj/THsjZxE8LCX2lkhxT2tpIoiXb
	F+ba5YkVqORXPVcyIp43AW8gquO6amIiBW9lXXaU+RwmqGD8boUo+/KZeCe9YVUfL60eYKKlnCw
	RmyWOhc8gCs=
X-Received: by 2002:a05:600c:19d3:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ac1209eafcmr61882325e9.0.1793374927621;
        Fri, 30 Oct 2026 08:42:07 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm144419935e9.3.2026.10.30.08.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:42:07 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v3 3/4] ASoC: twl6040: cancel headset jack work on component removal
Date: Fri, 30 Oct 2026 15:42:01 +0000
Message-ID: <20261030154202.2989936-4-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030154202.2989936-1-tristan@talencesecurity.com>
References: <20261030154202.2989936-1-tristan@talencesecurity.com>
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

The twl6040 codec driver initializes a delayed work for headset jack
detection (hs_jack.work) but the component remove callback only frees
the plug IRQ without cancelling the pending work.

Free the IRQ first so that the threaded handler cannot schedule new
work, then cancel any residual queued work synchronously.  This
ordering prevents the race where the handler fires between a cancel
and the free_irq, re-arming the work after it was drained.

Fixes: a2d2362edf9f ("ASoC: twl6040: Add jack support for headset and handset")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---

Changes in v3:
  - Swap ordering: free_irq() first, then cancel residual work.
    Prevents handler from re-arming work between cancel and free_irq.

Changes in v2:
  - Resend as part of unified series (no code changes from v1)
 sound/soc/codecs/twl6040.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index 650836f9615fb..826bde1a9ba46 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -1136,6 +1136,7 @@ static void twl6040_remove(struct snd_soc_component *component)
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
 	free_irq(priv->plug_irq, component);
+	cancel_delayed_work_sync(&priv->hs_jack.work);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_twl6040 = {
-- 
2.47.3

