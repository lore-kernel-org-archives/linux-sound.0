Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982753;
	b=dqZUU+8DTtVBtNkU1TpDxPVoXZtBydH6CczwbaiwBSOH36nJ6Ivb77k3B1AQpofevsRt
	 PiDcU9lv1PcWXsk5NV09MWoG4TEAsrtFfrcQly7ut30k2R5rnJwohyWlkaScTohjUd4Q6
	 y3TBLBthRwpYK99gGlpNDqmIyBIwX6qa8p6HNikBzBIR7HMn75o0jo9fOqkkDLhW4mu7e
	 mu35ppAIPbHfhr47pRPEvp/r3K2I7rhopfUfiAKYSxYCwPD9q1EWhSzT0DXbRlollBInz
	 EzGtZ65wyIRkqr034TIrtC/nS+k6IhGyEYJ/xjdhvwIwEYG9MviGnt5qiXGJhoydTBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T8u2P1x4rQsgh+erRfetmJts+t6jETFd7Sf2I66pwwA=;
	b=S7Zc8AleHPnhRxgZ7UOnCty07MZJwBUIheZx2C4D+nIhfFoj4okL6o7oK/uwNHPYkTsT
	 wnhKdHzyjOle2Tn7z5P+EhgTUUTMmdcCsqgj0fWkAavGdMJ3HXmDX5KCAB7CSEJhrxl9p
	 qF7tMHQ8wqns2F5hnwayGEtWNtYuNLy2bR23vTY21d9jpa49oPljrZ9ACEdLoEYb6a+n9
	 0jwDt6NwFbNPsuymncBwNJxSRnHmgD5WfuGjjSM31QtK45l7GoD0VdsFiYqhHYeQ52qXv
	 Wd40J/Rn5Wd5oFt9C03MMxOCsVwsbMBCWgoz3pFLwE5+bDgIsIAZeFcM4e1wyGLz/FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cadNhXAx;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FEC606D832
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49FEC606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cadNhXAx
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8490a7d6696so584445a34.3
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982752; x=1794587552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8u2P1x4rQsgh+erRfetmJts+t6jETFd7Sf2I66pwwA=;
        b=cadNhXAxA/rqKP1ln2MEexAK1169OSw3OJcUoBLA41LacDtR8r89jqHPUaoYVGpJEO
         HVQPn2s7TQIz6DQCwWaxSm1HQEmF2g05yMRyX0MW0KaJCFNC5NpDMJt2TKUhy0n4bDeU
         drSDh+mVjBzTotKtmVcBnrgIb/BRyEttlVc6BiRD5CdmgDRVGDS7lzV2ujom8sQqY12V
         0jaDbBmt349IRIrWKTJWhcqzatVcMuR9uguNfR/rURS3Rp4on56zQ0BaKJNCDhUYPZso
         GWFHAoGZWuFtqQ4A8AaDHhy52chWuVA+Hd3f9m8rZqrxVvbB/Wgq3yxmHVqVhxZnpXNS
         3ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982752; x=1794587552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T8u2P1x4rQsgh+erRfetmJts+t6jETFd7Sf2I66pwwA=;
        b=jy+N6w82fE9qajCJVJ7PEiP3d1iO/t5PM/8ei8Zr8YbifqrUQUaPMvenaBQHMWG6k8
         jU+ZBXkCEwDQJlugWfy4PFboiedxJJaPJDMK0+/Eh4CREvhSzoip8ltED+zj2JTxSHDU
         2vGB66jWFVCDQTu5/fGED876yRpqtCzAexnAT7GYEWxD6a7+CmoSqNAPVB9QGQIHKW09
         1oNnUdKK++L8LdefVGGJ9NMjtmlAg150ReMfUgYZt46/pl4X/NIlYdlv15zjv3M0XUOb
         EbMvPQHYY/Ufy43sDn749YvtusoY6JAg2wwRZKodhtnHjvRQ3FSFsoj5N2GiNX8WkzJH
         95ug==
X-Forwarded-Encrypted: i=1; AKwUvBwdQLjw8tiHSNm9q77YxFMpPUMLhIgbNDJA9JFXJC5g+d/fJN7F1bkFwC7WmTEW+S5qps0Fb7zbx0c7Gw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TaHBsiu/SBmH3Cw/6iMS/LzbZluEaZ23Re/+VBVYTCajsl1t/
	6gNKOfWHofKzY3QHuNMN1WA5IxS+aaMSKBwIpTNUrxExMc40wv0gM29W
X-Gm-Gg: AYBFou3S7smypweEgoyLsz3eOhKgsKcbjO2xu6gpT3/Z4HJJy0IaLkHrG8SOfATwK1Y
	s1pXPtrWebBuXfTD29xkecbHU3bKrovBBSnhj8Tx+HFOTp/fLBYc7YH8eBSGeNLAZxvBwkUvhJs
	oavbl7yDH7LYWm8/cBvaY+smyD4HYQ1TwT0jlMWU7bMW5Q8u0L7Es1kaZyzz3fVukP4EwkjzCLM
	dvm2NdFWK723x6jPFBP/ViT2oTKcCC4Jkhq0AgLmAW+U1uvbD70ALUzvjEDioXwOd5CQswKiJZL
	3GQ7mvBd1HYNSGp12ebkRa8SPa0E0hMdU9DYpwqu7A135J4YPtlB35DL5NonDo3PAhFMPBCh9pI
	Ws1hsauurL8+vtM9JbR+7SChBQZJZsqv5TTaQefSN43iNFSM9bJhlFbSAvwAnJF8E9CK3bGfGD4
	mBflDpRq+7XJqctIouPHJq+Gdl+FPmKE4OHY05RoyFx6L+fO5fsNhA5fIPJDfwNeWukHOo0Cq9n
	6zpivC2GTjwPVQPQ/FEe5D1PZ064FEUcgiVZLJULX8sCT5k6iGTSmcP+ObHfVgs9VophnE3lw7v
	IxnaE9dt/Z7Txvt94diNHQNgIMNqqQrrb08t7ssepyGkpA==
X-Received: by 2002:a05:6830:908:b0:7f6:96ad:36a8 with SMTP id 46e09a7af769-85f1cf93edfmr3229045a34.8.1793982752194;
        Fri, 06 Nov 2026 08:32:32 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:31 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 08/16] ALSA: mixer_audient: Add control initialization at probe
Date: Fri,  6 Nov 2026 10:31:21 -0600
Message-ID: <20261106163129.1006907-9-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
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

From: Christian Ruppert <arc@gmx.li>

Add the possibility to initialize certain control types to known values at
probe time. This is particularly useful for controls which initially read
wrong values and for controls which cannot be read at all.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Co-developed-by: Will Porter <mrwillporter@gmail.com>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 sound/usb/mixer_audient.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 433bb5479d8e..70ec3274a5e4 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -38,6 +38,7 @@ enum snd_audient_type {
 static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
+#define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
 
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -49,6 +50,7 @@ static const struct snd_audient_ctrl_type {
 	union {
 		long integer;
 	} max;		/* for booleans holds physical int value for true */
+	u32 init;
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -533,6 +535,20 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 		return -EINVAL;
 	}
 
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_INIT_HW) {
+		int i;
+
+		for (i = 0; i < ctrl->hwchannels; i++) {
+			int ret = snd_audient_raw_set_one(mixer, ctype,
+							  ctrl->val_offs + i,
+							  ctype->init);
+			if (ret < 0)
+				usb_audio_warn(mixer->chip,
+					       "%s: cannot set channel %d (%d)\n",
+					       ctrl->name, i, ret);
+		}
+	}
+
 	elem = kzalloc_obj(*elem);
 	if (!elem)
 		return -ENOMEM;
-- 
2.47.3

