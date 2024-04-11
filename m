Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5DC13F457
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712822296; cv=none; b=KdmPgq8ZngJxmsu7c0pJNnTpsz7NOQ3MPCihof2hQRjw76mVxUGCgz9H56BORYuXs++su6b7qYbLa0KlbB1duNunqlPR9c78dHjveZ3bb4PAbc0IJecWiiBf86lgBtcvdrZIMaEs/PU8s9X5OMiQuQvvuwGNQ+g0lmB5yporH/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712822296; c=relaxed/simple;
	bh=joMzTyz23qmG+b+PQc5HQqQmeMqXg/U9MthFl8kkmFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JBKDOb7y7e1oYNzUXnaWynBML4iX+F57EzPtkylV/Rfv6LH38WJMVSQ2evFJONsmSuWbgVLc4GprAsGeTIPa/Per5ovM3QLueAMxGenzaiGRuCWuica3PcyFVLS1gWcd5toudedUQhoi6Xgm47tp/QhWtriRnxA6Bd+zsDiQ06k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TuyymZNg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TuyymZNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712822293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SqVTw0UTFVtH3IwS7qkCBECw2fl92QBlfhYoyR8m1lo=;
	b=TuyymZNg+n3Xz33QmCTgO7139036up1IIlIOQpGokUY8VTE4n1f2JvIRDrNfesrgVZ1Wa8
	Oh8zMmTdcpJJs5nPtr7124r1TdWTq6hke8Ek2DLt3bA76NbzqRqNqSfiwwPOHW68lvRl/Q
	5/6gK8807I68SOPlbW8PcgvvXQW80lg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-qsZLkldtOD6LQeVM0hzbjg-1; Thu, 11 Apr 2024 03:58:10 -0400
X-MC-Unique: qsZLkldtOD6LQeVM0hzbjg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-78ec534f293so17323885a.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 00:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712822289; x=1713427089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqVTw0UTFVtH3IwS7qkCBECw2fl92QBlfhYoyR8m1lo=;
        b=b+bzTIEu1yRgoai7TrWK1J3o+K14qJh/F00eX0mAXmjFHgjOr8X0YDcPfblXW5Lf5e
         B7fCVDbrE4dZnFDB8kOENliiaKiFQpn4TnKrTKfxT8ku+AY8XvJ8/2IMShE5rfIA/3vP
         kcTv2OhsqlJtZohFwscjYzGt8xrmYysCPoUp3AA6uDF4lwCe4pgWIG2+ZvO7OZEy5Q/e
         AryI5VKon027rplLIS+P3ignEe8BIsPU1y2dl4WhHJDuBQtlPOhcadDC1113YxFmLYtc
         4+rtKcvEekKByDGidQXeVPrkDomjynnmlb1x9jn1qY0sdJYQJrzcqdrxkFjZeTvv95/v
         llGA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ6Zj/gYUgNHqz6UwWPWTWyK14eiS+ue0KandAFr/WQO5Gg2lpjEtEly3Hs36bZSP3dTIZbGHcP6ObVSIAAei3j1sVil5t5qLySrc=
X-Gm-Message-State: AOJu0Yx4wqafV8BjgMsNnOlDdwo0hP1PE/ffz1UJblrJP5gHuz5rHNmN
	3dshzFwuUVbwwoxdHT/TFZ/io78uumvTxkZUO3uLbve9xvMpGYQdoIovsq8yafz2Edc1hL8APaF
	wfC+bAf0OwCsEZGxTVKIsYsP7T3GRTYb2PMFzZ+FKB/X9teXdXfRIM91PoXyx
X-Received: by 2002:a05:620a:3d0:b0:78e:ba91:a4a9 with SMTP id r16-20020a05620a03d000b0078eba91a4a9mr2901285qkm.33.1712822289629;
        Thu, 11 Apr 2024 00:58:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvSh9y4I/IGdCNvTciq7eFbqCOuLJohMuODkTcOR2jUHxmkOOxyBUfrylL1fqN6UUVEDDAUg==
X-Received: by 2002:a05:620a:3d0:b0:78e:ba91:a4a9 with SMTP id r16-20020a05620a03d000b0078eba91a4a9mr2901266qkm.33.1712822289235;
        Thu, 11 Apr 2024 00:58:09 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id bj38-20020a05620a192600b0078d679f6efesm691961qkb.16.2024.04.11.00.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 00:58:08 -0700 (PDT)
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
Subject: [PATCH] MAINTAINERS: adjust file entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
Date: Thu, 11 Apr 2024 09:58:03 +0200
Message-ID: <20240411075803.53657-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
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

Commit 8167bd1c8a45 ("ASoC: dt-bindings: ti,pcm1681: Convert to dtschema")
converts ti,pcm1681.txt to ti,pcm1681.yaml, but misses to adjust the file
entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the file entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS after
this conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5431f06ab55..d39e0f2556f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21976,7 +21976,7 @@ F:	Documentation/devicetree/bindings/sound/tas2552.txt
 F:	Documentation/devicetree/bindings/sound/tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/tas2770.yaml
 F:	Documentation/devicetree/bindings/sound/tas27xx.yaml
-F:	Documentation/devicetree/bindings/sound/ti,pcm1681.txt
+F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
-- 
2.44.0

