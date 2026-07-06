Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6424D426410
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327829; cv=none; b=qGJ7wZ3lic1RrMNkOhfXGn7z8GKAykNHx2tvWzilkcJ1kqo3Kd7BxBWfJ+clz+xEYBPUhAJD57U8PqGULRSLsNdUf35rwXzUxipA1Ouclf/7XS8ZNO0qqsMaQkc95eSwkfzsFpnUjN0qxSb8ZpunWK8gCyoFGJx+Spb9n8Prpfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327829; c=relaxed/simple;
	bh=rf/17gnaX6BVMaP6/wBzL/dOi8e4BdWP90FhBRVBukI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrv8Hsw7JPdlKpjRJ1zhAuJuMInuxe323KA1FAAfCw4IOTDv1CZOV/0buPWpKPTZPap6bBI6oeNpZ/Nr/Ld9J1l5jaZeUPFKVAgn/j/MOP41DWeCpJDo8CcUSbivac58gREZkQ5k1B1Jn8lmYBbC9+BtWgVT1+sbhPZxmYBbGLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UECQ/t8W; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UECQ/t8W"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8482074a000so237436b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 01:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327819; x=1783932619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmBYS/wqx+QmmWVhLytQI1ddkicrGHDFtQb/fW5oMCk=;
        b=UECQ/t8W9NFgFyEX71hP5NIyvcANLpcuzIZ5wwtruDHxFHAyzvWD5MVymdxGWQyGxG
         UutL5pc/4PodyP/1dN4BWo1iDFeFLKTV7/B5tIoLguyDmFblcmtyqRWFS1MKAW+vGAtU
         /FXMg5pLk8P4vom9WH2LZZ8SPfH1EUquy7ODtavRz8DiJNPNZU59SloGsnYbd665K1V3
         Dtc+u/VjAa+tbJ8w/XXTCGx5s6rrzdLrLCXgYEhdZ51Wq3QJCAVCgfIvWOpBd+UgJzQ0
         8ThadItAS7FRjCxU77qHEvNGK9j2S6BOic9h3Qe7Ak2j9ClXc7KxLcAmNfnXf1NzkQO7
         Uzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327819; x=1783932619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmBYS/wqx+QmmWVhLytQI1ddkicrGHDFtQb/fW5oMCk=;
        b=KX997FgSE+cxCzXQlMt1G684jfKGxlvbkP4H88h5PPvHBEemgXkO9njYZb9vIUdWg6
         nYBLeSRuKMcbGYVdUADm3Mutco+qy5mjsR3EZn4sg6z5h2z1HrF4LpfNVWcxR7QBK3nW
         ktgmVRpe7OyjobGHz6g+lT/uFMAC//rWnUW5yfLWkt+6gjPC3D357C0bt5z3eGqH69+5
         AkYqgYSLkqsQ698CpGR5RBveComp+Zb4DYCh2hlkqPq3lRzjvUE3T/x8qN3UglOCNaBp
         dtKubSzEcsze0ALhEi/JX4pQHmaXgGGPfBPC03eTyl3xzncY+bgtyClwgCIIx6Mo+J2h
         dh8g==
X-Forwarded-Encrypted: i=1; AHgh+Rps7WBVpnSJCpJ4TpW8FhT0Pp6p/WeEYopUJWwVFgg59yjL/o/EIkB1rH/MS3qKWOpI2Vml1BgZvCPDYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKG/WmgbkkfGt2ryTFw10hrvlp/VIS+qXbSKLrY7Dl2B1dYssW
	Lf+YUbh3Fqi1WEQj/geaz6rd0FUQtxxzU8sPRIWWIr0cka+Cwh/i98FH
X-Gm-Gg: AfdE7cnKbQwXOhDvhT9svvGEESw+ZY9ftMov+EhxJbQYsZ5OyZSGB5KJBMpVoNKklXM
	n9dmHFRbSmn/+QRC/AcZpbfcvsnPDNopgloJOR8/iy/8sPp8Lt5/rxWtytNA3tjGWmFX9yGT3je
	oeNmVbGPYfpgP0u6OmG9xD15rUyAFakwrnErrWX4L7g5bXo5+8TXU55JlNw065lFVKmyiWxRGlO
	nPsK6XmXO/07MmRFq8aGAoiPiooeDF31825VGBtpjL8N2iGAYvW0zjngUFIqCJqaPbngN+PhVFN
	NnvjarnaPd3iCv2lml8UKaV0abprfamJZokC4/vRPrH+T9ljVuiuD1qNAaASk7SIzR9sv7xQOKK
	v8dalzdkTvYv5x3z8mXdt9HtPt5CdSPaNvXEPfRz+uJq1dDYwl02jM2HiQeWoy1WnobgGNHX/SQ
	MSMd+DXoyu7HmVutEQHj19JigCSA7IHaj+Pu+26JggrGQuXfY=
X-Received: by 2002:a05:6a00:a1d:b0:847:926a:7ae3 with SMTP id d2e1a72fcca58-847f6dd3de2mr7948410b3a.20.1783327819401;
        Mon, 06 Jul 2026 01:50:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c142sm3422924b3a.45.2026.07.06.01.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:50:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com
Cc: Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/6] ALSA: info: Return -ENODEV instead of -EFAULT in alloc_info_private()
Date: Mon,  6 Jul 2026 15:49:47 +0700
Message-ID: <20260706084950.49331-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706084950.49331-1-phucduc.bui@gmail.com>
References: <20260706084950.49331-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

When try_module_get() fails in alloc_info_private(), the owning module is
going away and the device is no longer usable, so -EFAULT ("bad address")
is the wrong error. Return -ENODEV, matching the other -ENODEV path in the
same function.
This changes the errno reported to userspace on this rare race.
No other behaviour changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index 54834dbe6b59..3b8ccda04e1a 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -78,7 +78,7 @@ static int alloc_info_private(struct snd_info_entry *entry,
 	if (!entry || !entry->p)
 		return -ENODEV;
 	if (!try_module_get(entry->module))
-		return -EFAULT;
+		return -ENODEV;
 	data = kzalloc_obj(*data);
 	if (!data) {
 		module_put(entry->module);
-- 
2.43.0

