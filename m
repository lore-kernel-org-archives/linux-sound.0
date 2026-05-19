Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BA73F0ABA
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 09:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181660; cv=none; b=sVBmpXnUY23biQ/k8Duk/oqxOAHJ6JZpOyw5yKeXIRlNPO22EVk0MOglwp279flELzZxPdsN6ds8dT40ftzcJs6yTsmQdwxQETSPSLfXnB3zPDZV/DDGuFEekPUKusAih+T7aV/XxOa2L4kiWCvV4vlH0aq78A5BIZlH3y1/38A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181660; c=relaxed/simple;
	bh=lAlepF2p1K4D0pPz8yCGKVbyHkktCBku7Z9+HtLuaps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=lyf3TfQtwr2WS+VpDF5vTQdq6XW2VlrSSog/aqSVtnM2P/3IJ36TWixnMad3fWGJ2d8wETn3kYo3B4zyOV8La+Rjt4dgGFMa7cyguvObkCjQDDZpwzcyfEoQfyCwK6SosHq7Us7i50uQk6vWxoGjjEmpjWPoEqLXlh1/oShoDfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NWAHwY2j; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NWAHwY2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779181653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CBYz/NrZc+Vq3hNBdRWZOxUhNWZcSq3yq7VxD6rnqac=;
	b=NWAHwY2j2rhLYp6hfzi9RdCL6gUNqZ+ZFZAWe3k3lbXr3WVFigG0uyc1PYpyhwJ1RmrWbh
	CtgXoaFuF+t2MMwIcEIsOxCKVkXzeOUikyOR44vUA3Ft34M4RQjM3HixmoBRIQ0Fe1AfBO
	1+ZisaZBqBai+iuar/pq7YcUGLCi2HA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-6QFxhJJCM6uOmZhEOhPD9w-1; Tue, 19 May 2026 05:07:25 -0400
X-MC-Unique: 6QFxhJJCM6uOmZhEOhPD9w-1
X-Mimecast-MFC-AGG-ID: 6QFxhJJCM6uOmZhEOhPD9w_1779181644
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48fe24773c8so16602805e9.3
        for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 02:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779181644; x=1779786444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBYz/NrZc+Vq3hNBdRWZOxUhNWZcSq3yq7VxD6rnqac=;
        b=pP72pehI9xz/EmMD8NqLFwX4pbNOLMIMe2OmJyEoLQmhM6caKx/totv+D+fUFL6DPv
         gXwmz0Gz3hASa7usoGHi1I7++mst8ihfoDnrRxZbQtVuVgqMix7LHgi30DFqoNSpICdE
         YKNW1/Tv5Cu4gVgp+eLTN0YKFpdRlOddT4c5+cCve6IW9DYZWaGMEMbH7d7xCC2tDTR2
         TlxdQxBXGh7E9F4tHv3uaZrf5u8Yfv76z7UKa8g/jRWF3m35at6+PsPWC+5JfOwMVy9r
         kLK6O3aJN3VvMZJppHsqZ63QuDEVt8aFFLYKnDSZdu1QYeEnZk6yFq6vhD9yLDKmknuT
         D5pA==
X-Forwarded-Encrypted: i=1; AFNElJ/YpsJ194AqdwD7pkBJ928qccY8X63jUHvlntmVenRuAlFTpS5j7LwKHPxtAimE9p/XUQHeNjvKRsJiXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuZE09RnRAgz8sdNnad+Ns05d3JUBAr68yhFj486mYlCft9bk6
	ZYXrO4lsmP8d2k5Jj3vxsbqbXmZEAmNfXnDOhcOcrzbY+1BtmhL6PJPEa9akDhL93SiREremU2J
	ObGs2XJcgt+ibxHBeExiZ9ilElDYXAKcTQR0cRbBG4thuZBBigEcos6IInzL7gJ3Q
X-Gm-Gg: Acq92OES1oSMeX2s22mt/GfCOgNRpmgvjAie4CfAryyJtYf5uTaW9IW/8nEzimEPz+l
	b5UA/b1X71JlGIxazCllHLPGZwZyeCeyAhqqTP7Lx0dRFlTDY6xg+lRQROsJW80955jk+owrMGE
	UXSaG7IsS22WTmfoVeBtW8+GWLwO+wizOy2kltzKfY1TxgqvPxF5ZNpDXORe35mZTTvOny47+C9
	pEmnOPVHyA7Fro9DACme+14GEwYm/ry0I60UN/PEMzjUhA9MV9+LfRnFmMfEcE12nKLubnJNuG9
	yx09EScR3342S+xJDsU4aM1SjgdrNpumHEIEM9VCSWC9l7+0hEdW55VRyOSCrHqchCa9klao18k
	dky63mYADsIEvLJoUewHUFPfwrwcFK8UPuDPzkLYLm8HGluzOliU2azdCFWR0cWuPy6ld0Lc=
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-48fe60d5693mr269970575e9.10.1779181644009;
        Tue, 19 May 2026 02:07:24 -0700 (PDT)
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-48fe60d5693mr269970105e9.10.1779181643625;
        Tue, 19 May 2026 02:07:23 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm40747270f8f.11.2026.05.19.02.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:07:23 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: drop obsolete file entry in PXA2xx/PXA3xx SUPPORT
Date: Tue, 19 May 2026 11:07:20 +0200
Message-ID: <20260519090720.301782-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MWh_5otcXFNEMrTBWmiH90GOED2wlzUNzHa0vD6eVg8_1779181644
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 42f67e1d1cba ("ASoC: pxa: integrate sound/arm/pxa2xx into
sound/soc/pxa2xx") moves all files matching sound/arm/pxa* into
sound/soc/pxa/. Hence, the file entry in referring to sound/arm/pxa* does
not match any file in the repository anymore. As the PXA2xx/PXA3xx SUPPORT
section already contains a file entry referring to sound/soc/pxa/, the
moved files are already matched by the existing file entries.

Simply drop the obsolete file entry in PXA2xx/PXA3xx SUPPORT.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f986eb688ae4..e541617ac448 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21774,7 +21774,6 @@ F:	drivers/pinctrl/pxa/
 F:	drivers/spi/spi-pxa2xx*
 F:	drivers/usb/gadget/udc/pxa2*
 F:	include/sound/pxa2xx-lib.h
-F:	sound/arm/pxa*
 F:	sound/soc/pxa/
 
 QAT DRIVER
-- 
2.54.0

