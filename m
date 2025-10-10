Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1030124634F
	for <linux-sound@vger.kernel.org>; Fri, 10 Oct 2025 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760139055; cv=none; b=J33VR2IzXyELeW060GZCoZUMcjMw/tMkvr7lx3sbubw9XIfCi9SFyqdhhEC3HJ7kmAK57/TtGc4F7qVEEeUgXzMx2veH220E8bnIlH/gnrheFfccqxiEL0wlkix9RTkIoDNunFhrY9PAwtupfY99js1e1iU96pB6LhVTvEbGo24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760139055; c=relaxed/simple;
	bh=FgkeBqOsjbeRgHk3I+MLzFTg/+x8XLDfjGktRioUugs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bfj7JKAWUp93n9dbZAK1Jy5Oa2w6+n9C8zD2+HVXy4oZca8ZfAfTu0B4W64avGz89EvgxlatBvnmXOhuy0rm83biOps2+bs2NMq6GbJewSGZIxRfsqDG4D67nvH4BUEJS07iP7v4nIKwlwWrBiTMmYHsG7cacSKQXkCki9/e320=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9A9V2g9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9A9V2g9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so2114833f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Oct 2025 16:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760139052; x=1760743852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYr/plm01c7dWtVorM1VEqtdk+b+bodf4xAATXQCqD4=;
        b=A9A9V2g9QWjo8TgHzeJGzFSBX9bqO9qN2PqX6bCzoadpz1o2c2ZpIwW930yLLJHULD
         6cJdtoVc+99EHpTo6BpmeMhXYECCxKYqRVh9Fqw4xN4VRZwYRl835qe9Btij33khJfFf
         mC5byDxrKqnrxvpu9irJaMuyT2ZRnt9kbQu5nbNSQCpdbtm8Dv8Y8bbe25oP+cUGVb3S
         fB0PCcVMcqYGIjJ9r6d4QSjxBD/ZHeV6UOu2Qdt1hTEdnFgio7tLfmS/1asxzCY7Hrgu
         rnnJ6mRNk+Gpvp/tN1yGd3M0zsYqHfrkyG9VLomuF6jsdeovotuzid+pHYcDhNuBtaks
         v2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760139052; x=1760743852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYr/plm01c7dWtVorM1VEqtdk+b+bodf4xAATXQCqD4=;
        b=IeNkGNp+jUfwkJwNbNNyxqbLz8MFSJ4Ce3gLeF7GzOxd8spSXhKqjN3ZsV9bYsndYw
         RH+2d7GxwyHN/meMlvrbZAgC3CMSnmyxs8ZGFAD5FXp1sMEFluxLqCIPoRpyjW13Q9Ta
         b3elB8vQUZ0WtU5wwS3ekXQtFhisE28cBjU4jsUtaIvPsPPDba4IqZTfK5mSgh8PDy1I
         r4+FA9KfzS4Otfto3+kqAsZwAAupVdYC35mPBT4tOdPkmBNr6IQ6utNz6m6Sb6vOqdeU
         fNpRdNwRhj4QzLrSUIq7PIH4OYfG20Jjv+OmHDDDWUHS4b72O21qU1QIqFCgmlgKeEUY
         wQ8Q==
X-Gm-Message-State: AOJu0Yym2e0lqeS8jXzn8/fi5yRDomGTaZ0lS0VvYMdJKaoHucpKh5w+
	GTOlUKYzRLd8k5F6EC7/Bk42k7FtSYjZ9/VOBYB9jLFsgUzV0mGSCFEfmWaeU+YC
X-Gm-Gg: ASbGncvPmEzf2J4nsPyQUrvUt3SvBJqE4tkz/RhaVDTCBW4HxqWhh+hFw2ADrU4G3+Q
	LgAZtkCbrtMODWxRVsrYzZLnjGLB5c3N4flI01KFkaeYLFbSUMH4Knh+aYE+ujEe5B6wKUGUKdy
	dZUUfdL3iKEBcij8kKN60zOtT8aGJ6uLEheMoqKmPmv6FWXqS8F5UxVyNuY4mwwjGZtXzHPNr3O
	5J4hGCiiyKTfHHYFMogoubbSG9qcZaS/7lg6tGetvCf4qRliFS8bMQ94YZqNF66D6h6XRLfa0p9
	YhbkQEwgnURQBSL3bAbg6NSN0emk+jsvdf4G32KPDEBSeAZvBTnyiKVI1rm+p5e/BJEDTIXWi5I
	NcKFH93NHxF6eWm4T123IZP12XqTdfb+Mk5BexP6B+UZbZ4Hu3AwzG7SohAbMcAuWYIXSAlY=
X-Google-Smtp-Source: AGHT+IFqPw4sYIB50Io+H/SuLeNfDS9P+mnMvCkA8IUq8QpQMFXeHi54SsLgJvs3nQqSlmFllLSIWA==
X-Received: by 2002:a05:6000:26c2:b0:3e1:9b75:f0b8 with SMTP id ffacd0b85a97d-4266e8dc01amr8910838f8f.47.1760139051881;
        Fri, 10 Oct 2025 16:30:51 -0700 (PDT)
Received: from snakeroot ([109.175.243.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb497af18sm67941985e9.3.2025.10.10.16.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 16:30:51 -0700 (PDT)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/intel: Add MSI X870E Tomahawk to denylist
Date: Sat, 11 Oct 2025 00:28:29 +0100
Message-ID: <20251010233026.5207-2-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This motherboard uses USB audio instead, causing this driver to complain
about "no codecs found!".
Add it to the denylist to silence the warning.

Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
---
 sound/hda/controllers/intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 48c52a207024..a19258c95886 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2075,6 +2075,7 @@ static const struct pci_device_id driver_denylist[] = {
 	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1043, 0x874f) }, /* ASUS ROG Zenith II / Strix */
 	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb59) }, /* MSI TRX40 Creator */
 	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb60) }, /* MSI TRX40 */
+	{ PCI_DEVICE_SUB(0x1022, 0x15e3, 0x1462, 0xee59) }, /* MSI X870E Tomahawk WiFi */
 	{}
 };
 
-- 
2.51.0

