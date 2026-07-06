Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE33E7BA6
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327835; cv=none; b=ddcm5XzdN+DQU0ujHSfwmGSpzs14qgPFzO/nwfz7Y2/Sv3v+qnQpf1CFoZWahoOuy81Jxz5jvGjwzPwXsi255pkNnOHXlulJ8cm+4FZO7SPamcpFQJxtAZBmHP/El2XVUyxZSLJiy+FXmXmvS2OsG7c/McYXWkSNA9hstprLCRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327835; c=relaxed/simple;
	bh=ENhMp/0z4K+KPk5wY1qhXxOXME7jnjqS6L7CXvLQ/xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VfNdiUS06QfnTw/mZqlfaefk5anXULnO99VSV0usoySBLNr+bp4zdBwMvv7pE306y0FTGQ5XB/Z46X7sCxhA0VK0dGwR3qZz3tLiKb2GYoVffJItZI45H9fjuhKmXGodLJsiZR6MFTNjYVOhgRwFVXFCB/azS3qgqKf0L0OzIsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoKrpN8g; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoKrpN8g"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8453427d3f4so2529656b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 01:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327826; x=1783932626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbJwjEcYiJxFPsHxxXYWr10WIjJN4DhZ+T0K4JfIccg=;
        b=PoKrpN8gALNltzRgQeXnhS62rlyJIdOCnv+EaBMfTfLv+O9hZm/CmlEv4K+8DfjlPo
         s9+KDogwmloMGtLXiL/NG6i2MCeS4L0817oA4DqLgRA1C9J3VPtoKccVjILD3yryxz6Z
         Vfkcg5iNDYkNelPtabXHkoIJdAihTxUbrMXS+W4BXmhK73+tFZ22dE0KPi3zIDcWRwLi
         KFBhoblidrrS6ttzCSfATQsah6a2p19Ai13tB2JUUb97Mmdu100tE96HKSRNUi5JIebF
         0q/Vgmx2VmrFYZplnmlaCPwEl48cyl1sc6Nj3BVbzWecSHxBHD8Uz2QrHZ79AWHRirVk
         x3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327826; x=1783932626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xbJwjEcYiJxFPsHxxXYWr10WIjJN4DhZ+T0K4JfIccg=;
        b=fzmgqBxieCBypAb0N8zVzTZYG3POkAleHA9ff/1w7qQS2yXjEyenoTPzQxyunwlPgr
         TYMuZicDWQ6hklIxa1cbLbfV5/0dxyEQrUl9IBkwrSktotZjNGy4yt9qhMNMqX+Jknyj
         PTKvQf+Jr4oYfP3HyHWTQ0hdCkRO9bpIH5JHmU6KaxRSvtZLIQbNltip4WxzaujadSBT
         geUFUHRf28JX16gnLrqgnSq2wtRFxmFL6evdMemGAeUvhTNl76Y/VDwvITQ7hXSfLc+8
         Zfmbb8V95GDr5K8AgJuuYdgBydbp/6XkJ78iBMwllyeamnFeeXOegNkX7Cx+nKz2vt77
         7B5A==
X-Forwarded-Encrypted: i=1; AHgh+Rr0CI/DQMHZthZzlscFDVd9TGWpsPPqpcrzwo08cDL3LbUfqv9+zD0u0Lv63DzjdOCF8B7zmwu59cRX8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/qH365kZP78FwQxe+kzOMhzhqQ1otQE3pKrmlbmrZVFkFyMy4
	VzlvrI0a3o9hsQAe2Dc7dcFC28uU5gOMwAHPnowuLVx2ZzJuXippktOW
X-Gm-Gg: AfdE7clOh5Qj0auKtAe+j74wLKA1y8WZyO07Ye+cHPzscfHfLWzwQ7izQCY7RE2lMQI
	NrHHBE9LRVcooR4yqrdinpRHz2OCc5hYAJtDfkR5kV1sXqJx/0KaNA/l+ZOxIjIGGnvK2tyb6SE
	Q89N2kD7/yICh9mCTXXf21RYfUWfrS4bWX0+HLLR5dRSdkcBOO1Eg6Ni3jnf1VkiUCPzfMoRIP0
	slVvKcGVMExh0OeKrVcR5JfNDXJVplFRv5i/L+4aJ8oV3q+Dc4/ZRJFcKDQ1j08qIHqn1SLZNZf
	00o426A1dGHGqlFatJqiPQb0xezMA6ynUyTJS7CoTNhlJe71DlRbtcRDP6UHhQRd6hFrvnYAUCO
	cUzadMYsz5orNkAB5i3xalUXGGRMqp4Mda8vuOE3Xsdr/ICvzfdlZ48ylYDAiG7pEQ3UER/F2cS
	2pxgE55xiMSgVrpqcU2Z9XS1PBkVxpbd9VYI77qD55YahM2uk=
X-Received: by 2002:a05:6a00:812:b0:847:8250:2b2a with SMTP id d2e1a72fcca58-847f6f95c50mr7929971b3a.60.1783327823659;
        Mon, 06 Jul 2026 01:50:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c142sm3422924b3a.45.2026.07.06.01.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:50:23 -0700 (PDT)
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
Subject: [PATCH 4/6] ALSA: mixer: oss: Return -ENODEV instead of -EFAULT in snd_mixer_oss_open()
Date: Mon,  6 Jul 2026 15:49:48 +0700
Message-ID: <20260706084950.49331-5-phucduc.bui@gmail.com>
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

When try_module_get() fails in snd_mixer_oss_open(), the owning module is
going away and the device is no longer usable, so -EFAULT ("bad address")
is the wrong error. Return -ENODEV, matching the other unavailable-device
paths in this function(the NULL card check and the NULL mixer_oss check).
This changes the errno reported to userspace on this rare race.
No other behaviour changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/oss/mixer_oss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index f5bcc7896542..3a1dd1edd26d 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -58,7 +58,7 @@ static int snd_mixer_oss_open(struct inode *inode, struct file *file)
 		kfree(fmixer);
 		snd_card_file_remove(card, file);
 		snd_card_unref(card);
-		return -EFAULT;
+		return -ENODEV;
 	}
 	snd_card_unref(card);
 	return 0;
-- 
2.43.0

