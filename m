Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25578681
	for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706701012; cv=none; b=ZKZ+bTWQgPICGwjNgZ13s4PNonBIhWw3gQMa1HNzReZ3jnltD5P77oRYDv6+L+0PPHXs1Znwi3A5R2WF9cr2GeAqOxzjBRXYIlFMbFzRWf6Coswtx3zvzfz3ELxpkqZz2dYKmhBpk0rqjFSGNGisGD/WiieASQ4DzJ9teTisWCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706701012; c=relaxed/simple;
	bh=Z767grEPJAg7ZmFSaNTvUlbErQGY8m3qRZzccW69p34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dny53pC1/TV4KgaUnqwbkZKbOtjj8BimIGZucX8Iyyy/5VtE2BK8fJfGcz5glu3ktAqkQvFPdWZ8ZDQAS5cQvSrokFJu8lKiFLzDUss5lSGWpqrZU3ZO/CvIy6RGyoimVY/hol3bXQejRwxoSZFaZwq6wm1r36PgGCkV0Fyqxig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zj1K/aHR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zj1K/aHR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-511207d62b6so1913124e87.1
        for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 03:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706701009; x=1707305809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86xD66Gk37rW4CX9zN+ILHdX1OsLTE5Vxv7eKal7nD8=;
        b=Zj1K/aHRwQmiWdWZ/6kRRBz+BJesU1vV6vDttBdqdryR6ZyEAIzTZiFU95kkL+xiRz
         0b2t/qaRfozvst1jNqIxfHhUv9y3VtzKydgj5z8UZvraOshw8slJmC0yihTtRUD3KgIc
         7xjjnOM4rhLFzFDrB42iLiuD7U5NiTPpzd7xr/+jjlPM7xv1Er4Uv4jp4GIccMU8IBoD
         evls5s+kkqyniHGtzI3lWZkQBvhVJmc1YarPlH4HhaDu5dY/xnlmQH6n5iAmZutssWDJ
         LA2mH6PeT0JjF/uKdWm5rHdrrQNUJqMggqSoiyowCIq9IRf+4h2YKmdrxg9nYH3lq/KC
         Mx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706701009; x=1707305809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86xD66Gk37rW4CX9zN+ILHdX1OsLTE5Vxv7eKal7nD8=;
        b=rorjcQqSmITnkbewCjBaM9YVla9MHSbm4JVgnTcCaIARhsK/24cFQu8G1+4R4Xh+Qp
         /XNK5qEVN83T6fcLzgmdcqMQ+WZ+B+LBFEIU7O1hgct6L6rwReeE6IISmhHZ2/kJhguG
         zLVk2e3NH/X9a9O4f+9UT6cy7b5dElj0VBmmATkvRt5hymRfi9FCTGSZN0UJqhDJ4k4K
         QYQFltcGDcQa4WKngcr4pLXBGOXP3zXcTMdSuB144i5xT/DDl7X4l2XmLiw/CSjZRnUn
         qIJnEJAijtiqqryFgHQPQT54ZLNBFN53HL0ex7nNJ9GoFTyxIilTlRpDMCGefjSIkqqW
         uSOw==
X-Gm-Message-State: AOJu0YyjAaLNZbL5Uq1tvLW6wsXLAtm4nNwd3z+FdlJX2Ak+H3y51Eoj
	m3HNDjs/4qydvevr/3b6bgD3q7nNpqr0ID7Wij1ZiPqXILm99Z55
X-Google-Smtp-Source: AGHT+IGnvC2j4ExO2oJYrv7RBfNpMIifxOLK1ZUUhtQOzD2sgvovY4A6Rrt2+6p+95MLFyNb92fBfw==
X-Received: by 2002:ac2:5b9c:0:b0:511:f41:dff7 with SMTP id o28-20020ac25b9c000000b005110f41dff7mr953202lfn.56.1706701008603;
        Wed, 31 Jan 2024 03:36:48 -0800 (PST)
Received: from aquecedor-3-0.lan ([2001:818:e81c:ce00:7193:3bd:90d8:9d8])
        by smtp.gmail.com with ESMTPSA id cl3-20020a5d5f03000000b0033afd49cac7sm3445383wrb.43.2024.01.31.03.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 03:36:47 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Relvas?= <josemonsantorelvas@gmail.com>
To: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Jos=C3=A9=20Relvas?= <josemonsantorelvas@gmail.com>
Subject: [PATCH V2] Apply headset jack quirk for non-bass alc287 thinkpads
Date: Wed, 31 Jan 2024 11:34:09 +0000
Message-ID: <20240131113407.34698-3-josemonsantorelvas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There currently exists two thinkpad headset jack fixups:
ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK
ALC285_FIXUP_THINKPAD_HEADSET_JACK

The latter is applied to alc285 and alc287 thinkpads which contain bass speakers.
However, the former was only being applied to alc285 thinkpads,
leaving non-bass alc287 thinkpads with no headset button controls.
This patch fixes that by adding ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK
to the alc287 chains, allowing the detection of headset buttons.

Signed-off-by: José Relvas <josemonsantorelvas@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dde21bebed17..4c78cd07e80b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9419,7 +9419,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_i2c_two,
 		.chained = true,
-		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
+		.chain_id = ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK,
 	},
 	[ALC287_FIXUP_TAS2781_I2C] = {
 		.type = HDA_FIXUP_FUNC,
@@ -9446,6 +9446,8 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC287_FIXUP_THINKPAD_I2S_SPK] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc287_fixup_bind_dacs,
+		.chained = true,
+		.chain_id = ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK,
 	},
 	[ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD] = {
 		.type = HDA_FIXUP_FUNC,
-- 
2.43.0

