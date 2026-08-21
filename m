Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D51381B0E
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 04:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287210; cv=none; b=TLKrSSwlqBLW4FTI0EQvnYNyRAFi7A1yznUA/6j4XLb06UwRF7iq1DTh+ONU/YHmFWh/205n7e8di6oDoCr8h10V9InfxVpSYk2QXKDMfGt3bH+FdtfqhVi6FZy5BGw6/zG1YxPTEmuSOfUYJ0RKj1IoXssIMV2fTf5CixZOqv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287210; c=relaxed/simple;
	bh=XBYj5wk5mHOhrmakKYDDRm9v0qThAv3JDCmmRtqO0jg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X0T8oIkY7wccF/6LjDIU1LpkGvgSejRri9oQkg8qNChr8iMjjPviJC91iOHXxsvY56V7VR7BF9VTi4PX7HpHzGNWUVEzWv329tlzcv8LGvW7XD2Q2ywByRyhaYMkA8eBf17jbLWd/+O4OXr8Niyog/mG9C+hf9+y5pd1skBjWww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=H3ntjQ0f; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="H3ntjQ0f"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso2988538a12.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 21:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787287204; x=1787892004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBQNwdSsbnHo5zy7bAfKYZELDnvZrQKGP99PRhFhTTM=;
        b=H3ntjQ0f9GZVrGDd4pJ8WpgNJ16Pv0nEQHkgdfzr2m+umI9M9hGgSjRLbtJC0BSZH1
         tSYElLEwD00pO0yVRu8UkULN/v8zO4fbyP6hbxc9m+oC7EcABLxb3bUXDc2q0HImTZTO
         A8L6yCy5AmuySWwcZRchHYY2f/FeN1mzOHFeL+G0/hPkDoPMNCzKihKamA6KNHrcZ4K5
         7IL5QGzpykrpiPctf+8txtdx29jNoVkZOMVOp/XOzSssImFLUXKgWxo9mtQwy73ffubW
         8KEFQ62ApcB9XEj5bad6z0u/6Sz7wWxui5fQ9CB96VSdh3elbGBQZ5SjmJ70CphxvQDh
         QnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287204; x=1787892004;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBQNwdSsbnHo5zy7bAfKYZELDnvZrQKGP99PRhFhTTM=;
        b=jD4ah9PpBX4HbSkRfrqH09Fggdd1led4CdLY6UiTG+W/BjgDdQKA4nVn0rcaXfCX3n
         Zvmd1zopG/4e/7KUn8nWho8e65BFJgi5JjdDyz4AwL7Lt2Kcnl/gg5JRcJtUbXvtMKgK
         uTlfYK+0O/7Ya7wWYxvhbltCxsR/7as6KDJPosskp+BAXq9QQ3eZAoJnMv2dsmBHhyEI
         wWm1/jJ7uyV7I0OEfbLKQmblzTaXwONCeWFsvdiCkF/ah8NxWbuUIEtFKFP+Yb7f6wXp
         ufHcqpQhoydqCuOrBMvxN57EZ6jzrb3e42szPuzmR9kVvUR1gcsjSKdskltqJ3jYg37t
         Vb0w==
X-Gm-Message-State: AOJu0YyQt5Bka25ErYwgnodMD+TkvPXGGsEHgwPj2cpGvdyS0c0eQnT0
	PDNlGnHamzxBRH0O89McDTn4zl4YLZsaib/eyLXP4iNg9otCwBKIZ3BIO2/0lcLm4uM=
X-Gm-Gg: AR+sD10O2ozMjkCDwOc2hNEkPh976+u2zjLnOVN4Cz5j3O/Udx5lBupc3+b8erIH37x
	obg76xJeVfAwfLLGvXMb5Z1zVWJOehQTqvPw5iGber3PiwF0wNvq63MAj1aY2nHjDzFW1+bSgav
	ZMwtqv2ssT1p49g0PYOsPyznDIYuWldbkSMV3J4I4yDQ4kMKK7tNYViAocpAozzahGWAMANPmy8
	W+wpFhXThnApbRgNcnoL1oqTY+g2qYfo9BUWrVWgmwU+t5HrQtXxETzZK0HNZ1ugqeVONsxZsSj
	FYrcpnZ0Kqf0B1+0mR7iSbekS5ncHEF6IsBhQD1B21plyKaXpjM/CbSylgn1YMdp5R9fLQ8Jhoj
	u11ZzX6yQVcc22OLIu3LkLCBVR3NZratnvqUDHt5k3u5GHU1o6Qdky+mRuQYRr6fXdbkDAD+wGq
	ivxj99K0SamxR7vekJkVp9uITwBh6BO6IyMOvmshDmvPFQ5bxgYEq/xQg+AifLtLZYN6SF3SF3T
	cX/dOTSmhEmmw==
X-Received: by 2002:a17:907:c30f:b0:c20:367d:f8b8 with SMTP id a640c23a62f3a-c244d4f05efmr903793166b.4.1787287204433;
        Thu, 20 Aug 2026 21:40:04 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b5d438sm268182266b.27.2026.08.20.21.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:40:04 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v2 4/4] MAINTAINERS: add entry for the ES9039Q2M codec driver
Date: Fri, 21 Aug 2026 07:38:59 +0300
Message-Id: <20260821043859.171871-5-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821043859.171871-1-karl@asseily.com>
References: <20260821043859.171871-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add myself as maintainer of the ES9039Q2M codec driver and its binding.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: follow the binding rename

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f8253..8a42a0e9720 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9625,6 +9625,13 @@ S:	Maintained
 F:	include/linux/errseq.h
 F:	lib/errseq.c
 
+ES9039Q2M AUDIO CODEC DRIVER
+M:	Karl Asseily <karl@asseily.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
+F:	sound/soc/codecs/es9039q2m.c
+
 ESD CAN NETWORK DRIVERS
 M:	Stefan Mätje <stefan.maetje@esd.eu>
 R:	socketcan@esd.eu
-- 
2.34.1

