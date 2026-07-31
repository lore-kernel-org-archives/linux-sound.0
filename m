Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2060D36A37F
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 21:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785532395; cv=none; b=GaEM+sKyh7OBPFntwT661KVMPuXqV+Usb41pW2kvW8kpdDoj3ywEQLXeO1jQnzLnhmglA9zwJvZUWMdk3Ovs4CfrF/lLZvwG5prvFYvxg4U349mTo4v/zZjgjA+8G5s9mO2e/OdRGZKy7NDzlLk7HI9S6tyB/uj7nZJG90m/5zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785532395; c=relaxed/simple;
	bh=Wu9Dr07Lcg639lAo7hGBZ7XnOinQfOkoIHTJtgWfaT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O58nuLvJRVt/BOQSCeYnlptfOO/4YGqu6SYCGKKffx6qwYLrbUCiXZrzp+++vhzhVs60YXh+EWIAkvwHlwRf+KWM+HGv7s2ihHgaVb8feMMM29F5amQ9l5pk8T9XtTU8ek/dUW/fvboS2kEO4r6pG52EAG4kT5CxD6IMF4bMXpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=Mznaua0u; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="Mznaua0u"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-476a130c138so1839102f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 14:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785532392; x=1786137192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdFkZbO6WEWfqKcOnZwaucKLTsE1Ityc0u7A6gNvLKA=;
        b=Mznaua0uE/MrlO/KfH9IpnzLyioOxV1uVyhhC9i6FKa7Rs8ol93fwAhY4xsZzjoCO3
         ZZqp4kesufYs7jil946Arjs6AM6s9ZWLFWAizC/G7gEUPyzDcp+CSTCNxgpTwSsm09HD
         kdYS3sSrtU0qxzUn3kwk47uIl160d94FFlwtNjktuENn0mCGPUrxQNGP5oku78W7JmBo
         J7H/FbicGNxp4YuDyGfvecmL+TW1QkhzMvcUS+xnx52FfVxv21z+mJhXDqWO6ivsAGrX
         U5SVQ7jZ4DBbISgoy54wDno1WioNf1561pKZwCuMPuLhalmrRmuuobiZlpeCYchfqitB
         hYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785532392; x=1786137192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdFkZbO6WEWfqKcOnZwaucKLTsE1Ityc0u7A6gNvLKA=;
        b=MGM9qywdhxajGR16jHCUb7RgqnVdgKvDeKX6CHuTJDmqnfmxkqZzK20Hn7tMz4CGq0
         JpxAY5wEDrC/TVzeFpme3YYmGdNQBg3uZdfpEmwSoAUGAVDcUSh8etFn3cV5biqnEwAU
         psICUsKYCPB/97KBlPCoiOejcztTD/3oh1V2Jwm5DzvjGH2VHgxwpVpIh5qb8hpLKIel
         A8Z9aE8HXbDh2QgIxacXkWh0d2zyeWuKtG5rpeu+Zxdn/IytNS+OHSJpkBi8xc6Wdax3
         /HMYjbh77PcZkmPASw0udu3rgJS83tmC48mpPfLYUzSWHEi0KZspHw/+a1MDTwduUee6
         gPqA==
X-Forwarded-Encrypted: i=1; AHgh+RpW4tE0ppqIIqtHjL4N+cQypB+MNjSBeDrJRNcivqbGfqAH4ZikAvUmTsMTdKF+BdCACeIECKYVYHoaNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6le1+r34ljwmRiqy6t70xs2B+3sFN27ZKwKYxcGicRPt3KRqx
	lyG9irXx4Reg9Ajg+EZwnQ9sioZeGuElx/M+fKdN81w3ynFFudZcSwWf57liOu5/PQ==
X-Gm-Gg: AR+sD11YyzeG3+alwhig5bn1Xk3MR9jAjHW0tJazAdhqFs1/g/T59oMjPtoyJ73/lQ7
	rqQcyCAVXA25kcMqtWOeo63/SPStshGJBuiHTs/5qQDdD8wN4b10YCaBeqvnGIAv9h8NGseaes/
	VsQ9fidBgmf3YjUlTDZu0ovclRJcPNfHnYPWHODz4YUzXmMtMDTO3+bhXegHSzIPXCXaPMa2ZeR
	jxOtEzhlltwOnuTm7BCRWUgtNp+HX2J+61/2lowpDvtP4Kmh8v3I22b3pcfJWJEHFsWW9gauhYJ
	aDmCdgr+wR0MgrTL+8J0z0ro5CT1GHyI9FczwzWVVxi2dqcZusV7RA4CQjDXtqZySFZYXhPdnoO
	dHlUKBlfXg1JqLV//Rk6fxx64IhkierHiZGyqxxEguyk7sWCqXPI3TBiu/k5Zp7TBBZDlJNDfLH
	hioPGMe54DnsFGaT+6EqAnk9/Eic/CKd8tm912uysDX5vsI7NxMUVfbEMm6TbvsK2oSGr1rFU1x
	UTFOio6PFfU+7c=
X-Received: by 2002:a05:6000:2211:b0:47f:853d:4768 with SMTP id ffacd0b85a97d-47fd72b518emr2379642f8f.20.1785532392267;
        Fri, 31 Jul 2026 14:13:12 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm9524142f8f.34.2026.07.31.14.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 14:13:11 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Sean Rhodes <sean@starlabs.systems>,
	Chris Chiu <chris.chiu@canonical.com>,
	Lei Huang <huanglei@kylinos.cn>,
	Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda/realtek: Add StarFighter HDA SSID
Date: Fri, 31 Jul 2026 22:13:09 +0100
Message-ID: <06865eaedf3de8dff199e9aa7e86cd135572f20f.1785532385.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <be87292613b24150d6321adac102b4b25d00e9e6.1785532385.git.sean@starlabs.systems>
References: <be87292613b24150d6321adac102b4b25d00e9e6.1785532385.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the new StarFighter HDA SSID while keeping the existing SSID chained to the same quirk until the new match reaches backports.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 sound/hda/codecs/realtek/alc269.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 42756a3f3f8e..4588dbd074ad 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6733,6 +6733,8 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC233_FIXUP_STARLABS_STARFIGHTER] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc233_fixup_starlabs_starfighter,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST,
 	},
 	[ALC294_FIXUP_BASS_SPEAKER_15] = {
 		.type = HDA_FIXUP_FUNC,
@@ -8022,6 +8024,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1f66, 0x0105, "Ayaneo Portable Game Player", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x2014, 0x800a, "Positivo ARN50", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2039, 0x0001, "Inspur S14-G1", ALC295_FIXUP_CHROME_BOOK),
+	SND_PCI_QUIRK(0x2145, 0x0001, "Star Labs StarFighter", ALC233_FIXUP_STARLABS_STARFIGHTER),
 	SND_PCI_QUIRK(0x2782, 0x0214, "VAIO VJFE-CL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
