Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC151494DC
	for <linux-sound@vger.kernel.org>; Mon, 26 Aug 2024 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724668300; cv=none; b=XlLd8Nq1I5uhi9EZE6LoTS3VCZdC6romxDi4wtSq8K0/69mNUUxWR6w3zykpkznofL70zroXP7CYvzeKyZsrWLkyzB8SOYTDjkLzdnCvYsZ3wnam3FecJJKoJcoQJ6MCpT50btb4ySXUJ+OPqijIIfa9b+G7S0E/Q4taZhvYiOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724668300; c=relaxed/simple;
	bh=D56uU97DHLTAV46MruOMwh3ENgVDe/CheFULj4BVelg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jZt3c5dB5mZItNt216n5DSw2U4nm1s9xyioxsyAsIdEbh+DIHtTN+BQfU9aCsoymawHy+87wAEx9dwTyFt4HvSkwmSkDIsQvYmU1mP7kTLT/cPyUxVTYcGvqK3m+EpC88XR4Ep+bgiix1EmbItwi1p6L/6b7JZ3YjlRUpR8oPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G7ZEIdgs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G7ZEIdgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724668296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0caQWYctkzPWXc3lfa4QY9g9vHYDKQdJAJoab25gorQ=;
	b=G7ZEIdgsscWwhJLVDqpaf9Bd6jHJZJ7+ZA1+CgjTPTFU7yCPM7EkX18eRMvxVbUejLbamz
	WdcD3b6mhGv7FCLuLAtIl51e7TmO5L7OkDpTBx4Wz8Wg8yhI98wStq2W5MOd3YeANQzthl
	nbzx6oe+ujXUkrDUskX9EZEQm3bAq44=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-h23HJowFNRWk33Df4H0KJg-1; Mon, 26 Aug 2024 06:31:35 -0400
X-MC-Unique: h23HJowFNRWk33Df4H0KJg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3719ee7c72eso2517949f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 26 Aug 2024 03:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724668294; x=1725273094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0caQWYctkzPWXc3lfa4QY9g9vHYDKQdJAJoab25gorQ=;
        b=wRMYM/sVGpI+mKyqmL5iZgkQkO1d2KWpC01qqP1vdmgOm7ZNq+UvKaQqQskKxq353D
         G7GCUiQSp3qVNdzW4+R7Dtb6CnKJfJddQ5I00Xu73zt8hbkdeEIDIH69pj5WA9XwqO7Y
         9TBKL03Rqx73muqV9gsIV8xb7cMUULftli5M+/mcMi3DhlSEbmyMs2FvSdf3+Y5ygw0L
         Gv0oAC+rbWKOBAwmyU67nUUBeoObxJ/lS/KAdr9Bj/98MUVkrh2A68dhbmtciFttoNd3
         hOPnT1bLaSjHCwpzGSOjCcBOUbqXpETS6EHXvHqaJK5TVePkf+bLiO0yNHk2lf2SFjOa
         vZng==
X-Forwarded-Encrypted: i=1; AJvYcCUaYkWsGPtPlBktWZNhGmFsEC0nCB9PDqQBqt5gIksVspTW7jYo45sirPHwTriCKOaqQ58ZPpOkpLi+TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWnj39EcSOKfGD6IwAhegHowAC4obe/0Iqut135ZguAPSM95D2
	wG/XXUdLOjJlpt0K+6IIeFfgzYKC4htFFGDksmS89gGdIfLG9Qglr2+A27apVD5GSaocGJE3lfm
	dxJpJtZ0ovTkayY2BKHFENnZQtEJvW7xpiyPkSULF+GqRdhn9Y8x9dfCxD/3G
X-Received: by 2002:a5d:6702:0:b0:371:8db9:939e with SMTP id ffacd0b85a97d-373118e356cmr5559978f8f.51.1724668293900;
        Mon, 26 Aug 2024 03:31:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUeeP55UuNdWAbZbdqz9KsjtE0dvBbjRTHSYopNttrDKLMjjvyaUEJgoMgra3xM9ZAZ8FKfQ==
X-Received: by 2002:a5d:6702:0:b0:371:8db9:939e with SMTP id ffacd0b85a97d-373118e356cmr5559965f8f.51.1724668293420;
        Mon, 26 Aug 2024 03:31:33 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:833c:88f3:25a9:d641])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac518043csm148327225e9.46.2024.08.26.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:31:32 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entries in TEXAS INSTRUMENTS AUDIO DRIVERS
Date: Mon, 26 Aug 2024 12:31:29 +0200
Message-ID: <20240826103129.18882-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit e486feb7b8ec ("ASoC: dt-bindings: convert tlv320aic31xx.txt to
yaml") converts tlv320aic31xx.txt to ti,tlv320dac3100.yaml, but misses to
adjust the file entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

The pattern ti,tlv320*.yaml in the section already covers
ti,tlv320dac3100.yaml and ti,tlv320adcx140.yaml. So, further file entries
in this section are redundant. Adjust the file entries in TEXAS INSTRUMENTS
AUDIO (ASoC/HDA) DRIVERS accordingly.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5dd88c28c0f7..6aa85a43d8c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22753,8 +22753,6 @@ F:	Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
-F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
-F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
 F:	include/sound/tpa6130a2-plat.h
-- 
2.45.2

