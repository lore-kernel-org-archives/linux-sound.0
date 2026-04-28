Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3707738F247
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391505; cv=none; b=jljjdx80RjTbw7iYQ3TWWK/v9+jYU/XkFwvlzevKIUY7/w4QY6TmbUlFnQITB7s9k5Wa8qbXzY/st5IjYuUwZYQ4m4dldDjhDr8kQLGnRbJz1sqXSVKwnfSqdckELVmdO2Z5EvkoGtfTl7Kh1/759chzD39eYX/St1p3glfFaf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391505; c=relaxed/simple;
	bh=bYlOzQ0k8f5YF1Simg7SMlOCPOGlZ0xAwS3WATdAVPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=feZhq030GtsT81Aq87cI0jtZ3xoid9Gm2LzVK0UUZPqD8E1w1UuxUyE1GcPRnkScqbWm3a1XajiwybaJHkxjPGzDkbDUs0SqairmTzpzU02vn+HknBWXyYaPP5JqOwLzJzMJw6Pxu4rFcklMHX9zWSexjPRog4lcv1diZQ/i1Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kprvDfrD; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kprvDfrD"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f351ca23cso5961416b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777391503; x=1777996303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4nqbVdNI32zDrm4DG7GgxG+FseUJMD0lyPz+RAgRk8=;
        b=kprvDfrDuZ7UWXZRYSPSDOTLgWPS8SZJMnNZbM86z+lxACRFlWGHHXvRpZGQMsu30o
         oPoVczsxvzM+7wR2UF7VaeWcLn7PpVPFGcZeCcxYljzyWV9xoiSwrlwGZpOWmHxcWnl3
         PNg8ChwtCIlBew6W2fBoRlhL8atUVwsS6PEkzo8HaGrHNtm8GBqtGsKcAJj9HVA1VOYx
         FVySi4abS2Y80pwAyQdzpLPYq381pTVTo/QSN5mJXJPWX7exWjb/DSCBf+vxpmZtbAf6
         qOUFOobJPb/KekKeFHBp2ZSi8X3oZtrfRL6lBw/gVBIkGsdalL7fETwJHftN8wlcuess
         eXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777391503; x=1777996303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4nqbVdNI32zDrm4DG7GgxG+FseUJMD0lyPz+RAgRk8=;
        b=qk/W3GUYyf7OfGC77+/AT7fa0xkKorVYk96lZfMwv1u3xC6M1EKtimyWi0geAipeaU
         2QfvHFTBUCMwdJcxz64h7dBF5QkzvOkDqPcHNY/XaGrbZGEutH1PP++fg3E1Hk83sbsU
         43iBUNOd3LqsO8ovxQqdOn/UKf1psRmv8PFU+5DZm4+Zld1xOKyZid4u+nDld5LKQabC
         nROpAEip4CIkh6821tKG19+07zUU730crOOVoxnKjLb4jDwpgbhx3V8amKOMIsg5XS0c
         sijTRzGoI4wnBgpIf63C1fxCk1hBdPfjTaLHRUhUh4da6jIQt79dcwcOfIOldHHooSuK
         q49Q==
X-Forwarded-Encrypted: i=1; AFNElJ+JEuxJCJimUjPaj/MUbUR8i1srOvPc813HibYzBZyLecqxIC5dJ5w6F+B3IDM12wPxKXFKPl3Uc+ayHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB62MHSOfJ0P+eI4LBnLNwutQ/GSgPmg/xDYcqGiSBZwAZroDA
	kfoXsH+eM7SeW5ZebR3YuWFNkwCp8FB9obSDh/7XcPK1RdCj8F0UGspE
X-Gm-Gg: AeBDietmpULT6y8TMgboYL/Rg1+YcG42cwqEbV6FZFxL5TeSCg++6KoR8YM7ApTZ4mb
	xdmq8EaG4ZfdAWZZ+eD96msjPszTleCLpOW2jKdxqE+nK8+El+AUc23bx3W2LlkvDgBnlF1xJ1s
	Pjd+qRgF1t3kiF4EQ+g5XDcYAeVVts6z5PAdSJyOd9ZrrGPyTPGb2vY7h/xlc6/sOmjqpzgZZ/Z
	bwQrLZgklhgXTNUpopGvNbZvUMO2CzaTS7a1tS5uO9Q3CbAQVldjkMtkH1C8bsd0aKtUtsjNJrh
	DzCkMSNKPNdZWj5qSHyT8jZEf2DihdQ/m34UWsLaZZy67DaMfVnCkOrBkwr6PLc57xUG9BMbJYD
	v7sNXgwXxz0lgiGFbGmvhQdpnSKrbVo7O6lT3INSjjSFf4eVwBDyWss/9goug6Bat8HkfxDZkgk
	50H3SIiVv4BSzDzqNu+1JZmtzO17VuAivn6UmpPw/MFcwcs45/swKH57MAPQcqImE5aXxC3Sggu
	YognzZ3438aCXsSSYxvtZrUnEVnzjry7GCN1ZKSdctQOTQ=
X-Received: by 2002:a05:6a00:1ad2:b0:82c:eafa:8875 with SMTP id d2e1a72fcca58-834ddad8cb0mr4076319b3a.2.1777391503300;
        Tue, 28 Apr 2026 08:51:43 -0700 (PDT)
Received: from abhinav-victus.domain.name ([2401:4900:8938:3da0:b5c6:1eee:37cb:4684])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae00c63sm3385830b3a.11.2026.04.28.08.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:51:42 -0700 (PDT)
From: Abhinav Mahadevan <abhi220204@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhinav Mahadevan <abhi220204@gmail.com>
Subject: [PATCH v4] ALSA: usb-audio: Fix quirk entry placement for PreSonus AudioBox USB
Date: Tue, 28 Apr 2026 21:20:00 +0530
Message-ID: <20260428155117.5170-1-abhi220204@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410143335.5974-1-abhi220204@gmail.com>
References: <20260410143335.5974-1-abhi220204@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The quirk entry for PreSonus AudioBox USB was mistakenly placed inside
a disabled #if 0 block. Move it to the correct position after the

Fixes: 34fe4a9df247 ("ALSA: usb-audio: Add quirk for PreSonus AudioBox USB")
Signed-off-by: Abhinav Mahadevan <abhi220204@gmail.com>
---

v4: Use correct upstream commit hash in Fixes tag (12 characters).
Rewrite patch description to accurately describe this patch  - correcting 
the position of the entry from inside a disabled #if 0 block to after the 
#endif /* disabled */.

 sound/usb/quirks-table.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 803e03d4d..4e9cfff40 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2652,6 +2652,9 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+
+#endif /* disabled */
+
 {
 	/*
 	 * The AudioBox USB advertises S24_3LE as the only supported format
@@ -2700,7 +2703,6 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
-#endif /* disabled */
 
 {
 	/*
-- 
2.43.0

