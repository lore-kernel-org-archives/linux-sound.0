Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A765C3F3277
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 03:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701225; cv=none; b=i+V9Mqa4hw5tB+ukqKj+oJ8m2r+FTUZUJ/OB6mP2inMpOFJW2RPWLcyftbGKqOWvItaQErIrtA/dMeYkbb9cAa672PkYbJ1rK2RQYxGTsNtxjd+UFLLlF5HmYWk94wfbpeE0I7F1j53ElWoeuM/TFEKxJclcP5odFEb+N25X9vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701225; c=relaxed/simple;
	bh=3pUyyD39CAfpY6VKEgAB8JHfqZlwYOv9LPCjxeEJFT4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eu3IzrfNZe6YLu1THV4mXtp2HmX25YxLnUZ0Y3nc1n9yXfzZ6jopsiVH7FO43f6mhwLT7nm28z2qI6A0/br1zssteb/UvOOJ/AUFLLycTyqaEOf0dIFbzhs1/q0XIihBzcx/udwR684H+VTwcw7Ew3IimVLy2Ju9byJQrYpYjDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=Mu1a+vCK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="Mu1a+vCK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso2069555e9.0
        for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 20:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789701218; x=1790306018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UB4p6nqgB9EJz4EKrWNfvZJy1eYlyCEmUs8uOozwbt8=;
        b=Mu1a+vCKr5NQT7bgRoC6SbdeJAPB+NIB58JLHjmO+iipHVB9/DsiIRBhvLlyHXXYQ9
         mUYXwJaTGIad5TO2zpb1J+Wec0FqAhEKliCNIbJEch0yVKo9ww/1JJhegG0BBWsZcELO
         Hf4XRUjRG1pIASaa8NLLJJ4hGorcnrhAEKgsHt8qd5fhPlyswncsEjrVNBqRCasHr9ld
         xT+N0kxLPeeS+ni8PbUjjkqT+HzTMZeXVUC3W4rKpVlXINrOkx7VWZfXIdjcpenc7wbh
         rxui1//v6fr4Tb3bFzmYkk630uuwaMT7ElF+WXYiXpF8eZlvf3YEkXVkVfYnvRDmfNoB
         pR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701218; x=1790306018;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UB4p6nqgB9EJz4EKrWNfvZJy1eYlyCEmUs8uOozwbt8=;
        b=ujweoNqTkN5nKu6Z1OYBCeD+vf/PS8cY7EgApvbKV4M9Q2uaZSe2HkcT+wvKpu3fvP
         0DaNdXrlRYy4lzDZQg0zbEWv9x8BFI96YVsgbysNx+EtLeXjK1IiVdt/MMyhiky+Dx+p
         jm7kipsKs/QVn++6Pn09vTb6eY+zzOJps4/yVGV1rzP+K7tEzwYabby0fC2/pxBbuM/U
         uia77cROOWXMg0+MJ2LcqJscgvYYJLAviLAJtpQPKCy1OmlHUJ6vd5htb9FiXHTLWPFY
         Ha3eQrO4cxZ4OtMLpZjzqs2ItlpOgvzh5h9CRb0F/1D9kWvUFm6D5ui8Jz1lVKHgmPUY
         NH/Q==
X-Gm-Message-State: AFuF++mbtsrkAPMiNGZrJxnGPslHTepaq0ugsMbUMcdDI1z83/9qUc/s
	G8X2SlTgZFPoHXtYSE+sHDr/5Vh9p2Tyn4TpH1czbueFh2KXLFL5lq+KRkgyU5nv6LI=
X-Gm-Gg: AYBFou2q/ATckwtRUH59S8o3Q8AP+FyEKDXoHa3Mfm4FI6gwbQ0cURbthKzEbN1JqEc
	z+eHtHDx2QeR+72A4AZIZYDSI4Sa1+FKd8/MSlKiWxUeV2iHa4sSjwEioDkfxH9zMkL0T+sQYdt
	osVXuQQ//dIJEjotZhA61NXbd6AEZKRIpqLZjrwpViNCvBFf2+t1FFSAwSSMkRdISK7xkPc5p1f
	tPQUbXzKRwDB/+ksJGnN3co4jf6B/pEMzVET0EfMsMTHDzDiRdkc0Pb7vDmZrDmVkjLVWia+hR9
	gW0iPwc3uplTmi3sxjg1S3Pgzuv6LbQVouE28UQfllsv2dbstY8qW2v2yCKllV0/Xx67f/tZqeh
	GDujFri03FM38qLNllCknxHxK2F9oRTRd5+3msp0q7470wfwmLcRHu19taxnxct3tBbNMXFKXf1
	LaXgytp+tLKAYi0LIvbJAvDtuVut1WEXjDpTCdw0jFQhzcaBYCrmdHqatukKZ9WjwQjOnVcS+/w
	/EDi3cp6GXq+Q==
X-Received: by 2002:a05:600c:5487:b0:49f:bd3c:bc1e with SMTP id 5b1f17b1804b1-49fc573a0damr10486565e9.25.1789701217944;
        Thu, 17 Sep 2026 20:13:37 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc79bdc35sm14533685e9.0.2026.09.17.20.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:13:37 -0700 (PDT)
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
Subject: [PATCH v3 4/4] MAINTAINERS: add entry for the ES9039Q2M codec driver
Date: Fri, 18 Sep 2026 06:13:26 +0300
Message-Id: <20260918031326.68542-5-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918031326.68542-1-karl@asseily.com>
References: <20260918031326.68542-1-karl@asseily.com>
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
index 20d67cc0e7a..1095476c1d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9699,6 +9699,13 @@ S:	Maintained
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

