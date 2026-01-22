Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14561360746
	for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097336; cv=none; b=c4PHr31sTEBzAkB0YH0ZvAeht058GxrixxZqAgAh/MY/fE15ibg5NBarvuraDEUn1awM4UjGHF+59AvgBkZXsbCd9wwOIacLeWnFIQB/mm39fkXF7gM0jJ+H5dq8ghFrIwwv5f8q1hBvQIdUh1stZj2/febPZx47JkYdq0FSgW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097336; c=relaxed/simple;
	bh=9BDtGVLm/YNavfQzhSMk9a18TtGw89Iu8RHa4FY/yvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mxA53u3S0m6f3N88gyhnS/MeENjz7m1cblrUOpjLFn2pdZw5BiSV+Tgid8zFPi+RPLqgNLyf+o8skYD4ZEn49bHLphJjypILExPavVc9ddi4spR9RZ1Y1QgSb5906JvLBPyHJiO4zjJtgq1olQvY6rRtCzlL295jAlDCcHL9TC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ss1uVZj7; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ss1uVZj7"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b6b0500e06so1520474eec.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 07:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097328; x=1769702128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pq4VY/0urpQ2UO/GnbuvVu8bQyR50a/yUYGs16zTipM=;
        b=Ss1uVZj7KFP5VpFPeNbgCmoVJyEcQ2bAaPJa/GFIsmZ1y6+feW72vh4Okh25tgezlZ
         8S09KB0wduIbkEvoktIjlRPiXxMwOB05mfGWJ36rI5oa5Z6TU9LvxgnDScu5KZUmwp8o
         mlfo0OK3jhvLK1EjEJA/p/+IvRK/1YL628odLheVIc0brQlv84o2cHQwDRzDT5QCrA+h
         RdUeZC5K9TxVvrugouTVK4/MhUEjlaOIK0iDtNP2vEZdH87WnIAq4s0UHTq+YzhmYc1t
         zdNhEnKyY2pKgyytGhB3alhPG/MnrLR3Z/tN6Eg58z2tP4lI5SeW9hrSF1t/KJpQHf3z
         eNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097328; x=1769702128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pq4VY/0urpQ2UO/GnbuvVu8bQyR50a/yUYGs16zTipM=;
        b=YK9PFDe1BD0Mxxl3fEswdcQ7ZVg7gozZpDTYEQ4YX8jcKZDuoXxBa+Bv54ijvxRCRp
         TOiyAhfzEFYwK7hjjyG0xgGwpZImI+W7Ffu0jibTVuIQ0FbRCQx9fU0MYXExJ4OPuyqn
         GMqLaNAI7pn7Z4pOk/Y7jpvMKYjx3MIDH0vsCPlbmX0/vHvWj0URGuFC9UY9hhQ/5pFH
         m0yECaLdPBaiwoaYWSqz8vM18dWhL7Qp4BTiU79SaxLjkm2sR4hEsNdEiMaPWQfcHgJW
         QMKLH+DssJE4OsN5mXeCB0m34qrmOm+AClfm0BsW2Fj+RRgu6/GLXaExLxnMBhz6Ynvw
         YkDw==
X-Forwarded-Encrypted: i=1; AJvYcCUlWJ0MhuhQVFo4R8BfhJvMKhpjxklywQPopfG44Uto3ejvknU/5QQbyleNyBbJpgDh3G4lb5qC5z+Drw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYfBHnUXWo2Wsl658Jg22Szz5PrRmvw6j8ke5gZzgJm0+sPvRQ
	8LEGSzJqNS1H6ajJuuxSqgEEW+nvL40OohPz0q6DKihnSaVEZ5c4riPo
X-Gm-Gg: AZuq6aJmC91g2WA6Ij7JDQq5+kX4VLt2g1isJrSliNXTrZ6NzPKLpTHp/fKus24tuzw
	FVVrvRvJmVYjS5KDzDe+lXhcbaMqH2bB5/88TQE+iNClgpeE4fwhZrbRFYLaYMK4LwFuShVWIBw
	64WgqYLXgnEQm8sCQlvPVGEwhIp3/QamYY0eac+WOJMuabWsROQTBcXxvTc6jsL3lBKUVlmeQIv
	5Op0Cr0qSrRVGCW+WCOHtX05lDS9CJxGA7F/XnZhFRKin8FEL+evtF/1cjS0GSp+JOMnDfXFQS4
	gE//N08alKB05f1YZeSk3VX4qjminFJnYZNt+S4IzMSlR1atczXtRmFKma32QV4gQMpZxmhS4tb
	2U2aqxVRT0Swbhp7aDNupl7QBsevinCan2Zur7TfSTr9KYF0+u8s3v6qWyFb0op+JXsIU/kvYR+
	4G9jLVmqGdMzfeBv5en8Ht/Zzeuxr8wtAgcYFomvUti19mQnsMzPsbAowqBO/bcIA=
X-Received: by 2002:a05:7300:1496:b0:2b7:1ef:5862 with SMTP id 5a478bee46e88-2b701ef630amr5208031eec.4.1769097327956;
        Thu, 22 Jan 2026 07:55:27 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.90.16.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm28935599eec.32.2026.01.22.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:55:27 -0800 (PST)
From: gongqi <550230171hxy@gmail.com>
To: rafael@kernel.org,
	dmitry.torokhov@gmail.com,
	Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-acpi@vger.kernel.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	550230171hxy@gmail.com
Subject: [PATCH v2 4/4] ALSA: hda/conexant: Add headset mic fix for MECHREVO Wujie 15X Pro
Date: Thu, 22 Jan 2026 23:55:01 +0800
Message-ID: <20260122155501.376199-5-550230171hxy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122155501.376199-1-550230171hxy@gmail.com>
References: <20260122155501.376199-1-550230171hxy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The headset microphone on the MECHREVO Wujie 15X Pro requires the
CXT_FIXUP_HEADSET_MIC quirk to function properly. Add the PCI SSID
(0x1d05:0x3012) to the quirk table.

Signed-off-by: gongqi <550230171hxy@gmail.com>
---
 sound/hda/codecs/conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c697..2384e64eada36 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1123,6 +1123,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad/Ideapad", CXT_FIXUP_LENOVO_XPAD_ACPI),
 	SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
 	SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
+	SND_PCI_QUIRK(0x1d05, 0x3012, "MECHREVO Wujie 15X Pro", CXT_FIXUP_HEADSET_MIC),
 	HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
 	HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
 	{}
-- 
2.43.0

