Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837347;
	b=sszQRVynHG+AjdvWJ4IrGdugKxL0qju5n7Y1OfTr7zQm/q31QZdkBSL8QtT+0jOKy/Io
	 rJcEe8tB3iHpnhjT6prv120PHncNnAF4So+tRNxY7sITvjBldik9UWVKy1MqPcHEe9tmd
	 7Pq7ydGXZROYdetrqzMGIxPBnuLBNvx7mJkFc/25lHRYSFILK7KuHatWN+4WiONJvHki8
	 iLMjyCZiTnkeBhmVFXG35cI495BYuJSiELLhVGZ9yQgQqqCY/BV+urI2l/ugkWpm673zb
	 7TZSKkGRlMD8T2+kPZfSfhuL66m66Gsqon8toTCi6u5NKrl/2qcX+kXxCSKhLD7+eWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=izulAhXaz6dK/9l1wG0GpUrapqlxdbrdUeXDR45NNrQ=;
	b=zZddb1V6MrajpvhIvZ9g0UmJS6r2a7p51TtmKTsussuXMpfcNZJ0SMRhbAX1UiDrQR4Q
	 i10mJBcgX2VJlFlBita5uGybHSr6EpmhuMLhRldwBnHb1xQTeSC1UzE6irAxRcuZhgYh9
	 QSdNc8AqUZA6mEgCKX2qqR/tIZmkqeshMe8LqGLGllFDfHofzNI4OLRZXtLq7hy2gz0hy
	 2xskn6y2xbkohm9Fefc6+FFgmJSjQWG+sgFwN3TeQQQqof5R+VDmm9FZ3USgURuecGArV
	 A1Ff1VmlLMIDWFl/5QbRDiyYWisrcemR6ZlB6v9/LIZmufpT+++sPt08ftn+PFpEGvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJHiKG40;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48D1606A31E
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 03:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C48D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJHiKG40
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so4484183b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 19:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795837346; x=1796442146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=izulAhXaz6dK/9l1wG0GpUrapqlxdbrdUeXDR45NNrQ=;
        b=UJHiKG40c2QFQmdXwj/soAVJm2bznwjHvg+7+xNL51lUnjoKJWEGoDD4JgIVxb9g1f
         lf5DXoRPNr9GY8zV3EkTkY4KqWR6iCgpP4GUrlMg9iDrfYVm5wPw+DgBiJj39t9+82OT
         fraC9ZBlwBIx4rbQKkQgEwHFhH3o5ICGzoXbqP9GN7fYJtZ8ZbA3m1zEq9n4JR0fYboA
         ORHjNjNj+erfStXrrmtYWHLZYAuOsFXFJEP3NdJTeQmthKo7XyZ3Pvy4OcehtcpqsQXZ
         2HT7WzHWDXxE+1OQCR5p/ULSHb/KmTbN/fsU/GqimbbaR4hz5eamTuH/SC5ANSvEWrNk
         n8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795837346; x=1796442146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izulAhXaz6dK/9l1wG0GpUrapqlxdbrdUeXDR45NNrQ=;
        b=2MZoeRvDDfS+Ux8DrcCtnXgVhEF5HR6hEyJLoG0PU7ImKlyckKzIILYs8osDmy5FCi
         IndZnNeVzubvn7SyPbgPJxzdtOFn0V/9fIIrAno9uuTrTx3UZHVBqCshL8pNcHuIbQTx
         a89JqbdHQwB1qaJL/1AiucfmjgqaveEInVI3a8zuKH4xw+igQR5Yq1ogJhZ4r/5KsZUA
         l/E+vS9Aw/jJ+BND3yAwgBDgWmqGXZ9Z+GEMRUp9Hw/EWEf5B4gi8L9519WIUY7WfEd2
         5S8R2gRzmhEZrGODmoRsYNg4UjUU3DL7mXbNYnepyBbr/+xkQZu9HoAOmADMIQcn3VA/
         bbvg==
X-Forwarded-Encrypted: i=1; AL+hErF93ALV+akxJbt/hc2BGsjNjYsWg7wYYTF0EWA9CjcainxM7I9bcsV3zu59oojqFoeCwrZD3cM2w5QVwQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/KzW4xW7DpaCIo4KQwuLyeGUZoZMluHNbUVc46nqLKIgT/LRwH
	d+rt7EtD3znz2Mi2jSeVbMMmU6CdStOfx/42MOwQmpxT5cHxS0CkKJdZ
X-Gm-Gg: AZFdTZeiHWg3u9WEBeHRg3dKJWQAimyFZzRb7HqN8Dh0fm2wAeYACvXJ6VJe5GJVYSX
	+iYwC27j3E/SyBPhz8b2n8zxtmBRgxFV/QL9h8I1mL7EaTJab5B+eyQhmIzDpM4HKQove9KFxPz
	xILcS1g9bzwF0ff517kn4somlPVV8q5aRd/MLsDCa3Jt8NIEfmKuSSmGeBvy6VXKcHxL6FmJiNT
	Qhr/HRRv6h0CUs45iNOr9HZ2ZVwPNeClEdX+PQn7oCqWh+2NI63WS3BUurN+h7uwXMC0EK9Ev0B
	vQ5VuvSycJAao6iRiWzsTSdzNiGOFMiOQnbSPdK4GvlaUtN9lOB7tTTsgtqokPgraaiFNYSN4ck
	F+GXtmYBN/WykMTI4uABPJ/5JoX7ljRbOy8bMucXZmCl++dsQdk7x4kB2wrx7LDHccHfxNreY7h
	3KVmzZTo3bpQQkm1vBwJdnE1auTQCqpIN7kVPsRh/wTTH5Vdf1GJsQM2mxG9e+eSxjmRR5/e1G1
	JNN/UDlDB+xrS6LXo94IV7GZ/X2Wu8eMEE2F2mTFJ/NnRJLq6k0Xv6aROr57GwKzOziSDmC1CwR
	JHCeGefIVZ4xOFkAl/sWeYOjEH4=
X-Received: by 2002:a05:6a00:b86:b0:874:705d:f63d with SMTP id d2e1a72fcca58-8c87c38b5ccmr22393784b3a.31.1795837345926;
        Fri, 27 Nov 2026 19:42:25 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm14130965b3a.36.2026.11.27.19.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:42:25 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: everest,es8316: add everest,es8336 compatible
Date: Sat, 28 Nov 2026 11:42:19 +0800
Message-ID: <20261128034219.746038-1-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the everest,es8336 compatible string (with everest,es8316 as
fallback) in the Everest ES8316 audio codec binding to match the
existing ESSX8336 support in the es8316 driver.

Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 .../devicetree/bindings/sound/everest,es8316.yaml    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index 9060358a90..d0179476e9 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -45,10 +45,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - everest,es8311
-      - everest,es8316
-      - everest,es8323
+    oneOf:
+      - enum:
+          - everest,es8311
+          - everest,es8316
+          - everest,es8323
+      - items:
+          - const: everest,es8336
+          - const: everest,es8316
 
   reg:
     maxItems: 1
-- 
2.47.3

