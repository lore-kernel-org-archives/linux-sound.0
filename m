Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A158C3D5C26
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 11:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102936; cv=none; b=BcerUt92wUEsrPa294TuUB6Kg3FwMxRIt998CkptZojsGDXzsZ1AAuNxG6F0O42vgggA1crmKaseqO3Rfz+bgtkDzs2MYO3mGsSmEoAZFGzQitAOw9+rIdq7qNJXG38mQmsDe0ci0jxS2827CiJ5Ts4XofxT4ZoJt7G2aQ7AwVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102936; c=relaxed/simple;
	bh=SW3QQ7TLL2MlBWmSFLXbFPE4nTuOfBcLz7c3BJkp6jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDH5klRGiGbSwXYecyODhIM+jPpX+LNPcicmM4GNhj3RX9JkqMkdflC/cn19wsckcpKXoQd9ZdEbZ486j4CSeCPRyhyxz3AK4rd2f91+J62hHr+9fMyAStjuDxk8z/0POaa9t8/blTKNFcx65QyKSpWRO0mb5zc4PpwxP1pItvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qC9JIg7L; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qC9JIg7L"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8453427d3f4so3805605b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 04:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786102928; x=1786707728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6lR1SogBn9JLBrBLFh5Dez9g6Tr1CXQQppMwm2xDcc=;
        b=qC9JIg7LJbPyoGFssi/HNtrHcI2V70QyzK/e8fVsyG3hK4JtPgFsLeFWkYu0A/CqLd
         z7lNCqFdBKE+SedeysAeMJaR/PC+eigrFSVY68OphWfVYTUKIimHl7PnfDO/9U/vk3iz
         biewQ6iCyIfMCZQCN66Fc8myc/Ld5GixlIjiQP/FAWR5Nhp2qOLBMnAftzRxrZ9W5lQk
         f/+SfHbeaIODC8Fh0Ys1DdVBXShcjtnHrnStN8KfZh0vSY3fvJsgvdH0/7MQ9iI2Qd2T
         0unv1Nj+dT43l3K6PNdo5b0z96Wwu8ISSYroPeWFsb9k1z726ne+o6uEV4fJHLegxm9g
         AI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102928; x=1786707728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6lR1SogBn9JLBrBLFh5Dez9g6Tr1CXQQppMwm2xDcc=;
        b=nKf1bnwYzWX+1kmuCHzHomt9fouKis6afsEOMZ5RtgWL03IH1Kc0XClhY8HhWl24jD
         NrwQgEhO+HZyxoroT7kO0vhk8VJLHrUt9uPcaDMhLLbRWGnOCkri6i3lgUZOeZkn8fPl
         /6QeY6tJi1oL77vcGAxLGv4MvdW8g8p+lZzz3b69x2+4WtoB/K3TdHQzO4AREIh0QzjZ
         DcTSUEJmh/jhyZdp2lK4V8OIUQN2u6McoUqlH/VFEq+nJkQbHfsCsjq2GrYjPLsk6mAS
         htl3DRZ1vOqLsKKCSoNzOkQDek/IBgNIjonA41U1eeIq41MpeW74MJiLgwlsRNV3kOk7
         xV6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqKOffbSEOrJpV6Sdz/BNQ8dr7+1RDL5EmiiALlyXTFcqRDGah6LHKBYASZbkmGvtq4IwQ6MYAYlT3rjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp4h1GBd2/vqYQd1uJ/jqQgoKYKgvz2Qtj2zjjz5SHviM6UxIs
	UaI455a2cgyNM5D0jZ69EioR8O6PXo15Xvd3cuiPGPvuaq36p2bh0/yA
X-Gm-Gg: AR+sD10ZzjTtUC1JiuihLJewrgf//NB+bHMwzWnuG5tEapgy7y4J9Y+FMcYu0cEsG3m
	0oCL0Sl+vtJuOFPFo7vfQQ5lUDiIlOy3ahkKXd2SH52HAIY8GQXFE3lmSgZBIQ4MsgEOsiADGQi
	bmFZxwK4zHSq+7xMi3Nmhrjp/Kc+J/Uk+ZND9IdrMzhVJQ6FHjb/tUi8YrP/GxB3QDjyq499/u/
	cnHEu9/W0K01N6as2ftWOs+2PYCEXv6HbKd9YnZioJVxjl9sqdoA4PX7fT/wNHBJvEqUXChD03R
	89iZzwT3jHz36X6PJSV1XRpQS8aZOLOQQ7KezFtBLovPQ0NCwy0QnfLhXm3NOXFXW2D0a3gXX50
	Z71nMi8+a4YU+WwPeOpl4MzMngHIQSfVbj35nYr1argp91nsfA5kG95juO9FZMMdzaml3syclqH
	eXtoup8Xl4sgTmbQdtaBCuWZt5zNwg8SokyLSpqVL6b/fq3yzvYWMkG8LGBe+48lP5yiSfsNJsQ
	F/b5+OdFyE=
X-Received: by 2002:a05:6a20:d4b:b0:3c3:8255:8c4a with SMTP id adf61e73a8af0-3cb85ea2ee0mr27242276637.17.1786102927754;
        Fri, 07 Aug 2026 04:42:07 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm6930508eec.4.2026.08.07.04.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:42:07 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH 2/7] ALSA: ac97: replace strlcat() with scnprintf()
Date: Fri,  7 Aug 2026 11:41:34 +0000
Message-ID: <20260807114139.1661-3-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At this point name holds the vendor name written by the earlier
strscpy(). A space and then the codec name were appended with two
strlcat() calls. The else branch below already took its own offset
with strlen() before calling snprintf().

Take that offset once, before the branch, and use it for both. The
two appends become a single scnprintf() writing " %s" at the offset,
and the else branch uses the same variable instead of computing its
own.

The bytes written and the point at which the result is truncated are
unchanged.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 sound/pci/ac97/ac97_codec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 0bb65be021d9..dfd712ef0c63 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -1832,6 +1832,7 @@ void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name,
 		       size_t maxlen, int modem)
 {
 	const struct ac97_codec_id *pid;
+	int len;
 
 	sprintf(name, "0x%x %c%c%c", id,
 		printable(id >> 24),
@@ -1849,9 +1850,9 @@ void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name,
 	} 
 
 	pid = look_for_codec_id(snd_ac97_codec_ids, id);
+	len = strlen(name);
 	if (pid) {
-		strlcat(name, " ", maxlen);
-		strlcat(name, pid->name, maxlen);
+		scnprintf(name + len, maxlen - len, " %s", pid->name);
 		if (pid->mask != 0xffffffff)
 			sprintf(name + strlen(name), " rev %u", id & ~pid->mask);
 		if (ac97 && pid->patch) {
@@ -1860,8 +1861,7 @@ void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name,
 				pid->patch(ac97);
 		}
 	} else {
-		int l = strlen(name);
-		snprintf(name + l, maxlen - l, " id %x", id & 0xff);
+		snprintf(name + len, maxlen - len, " id %x", id & 0xff);
 	}
 }
 
-- 
2.54.0

