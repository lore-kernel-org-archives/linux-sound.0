Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D4B51CF62
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755827; cv=none; b=YntCb3PJU3LJcKZIYHUVed+E2oxgolOsnoz2VTINsZWlJnHgz2JMlgeKL2tu2YeIWpMUjXne40B5XlY78te1eyWv21rsPOHBiM9jQYyAMw5DPlc2j0WN7h2n51JTCTLAeniDMNzCq6I7oJHjVIB4pdu9qomulbDfQd71JIxaLDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755827; c=relaxed/simple;
	bh=3pUyyD39CAfpY6VKEgAB8JHfqZlwYOv9LPCjxeEJFT4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DYklAyxosic7u9AEJKGiynjkL3MR1LGVW+NGjCdCa8KOxIaNTuXPWI9TnZLWQBCHHJQZIcKnXeQV90ndWFrNEb7Ly22kgi7GjP34hMqjvenWFxpiobk9qZJq+eAUEHn6ovS1oCQjZH+KFXdsFOgAddJYZNzQD7CjwucrYfWcQ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=fOaIf3kh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="fOaIf3kh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so6471365e9.1
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 11:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789755823; x=1790360623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UB4p6nqgB9EJz4EKrWNfvZJy1eYlyCEmUs8uOozwbt8=;
        b=fOaIf3kh03Pd/D3iBC6qds75+AWthuEKmnnZKrjxZbImN0DTNRSV5gt1ba73Gp+Q0I
         3uigIxNtRr9FWZr4Nt2yHioMjZcNM/+7IPEI4k1G8Ef3kxovWaY1wKYtur5fdGs3fto3
         mAD/xEtwmeWCqPdxI7JyfR4NvWKoCeI84Y+uqlaaFv++mTbGiN+hoAG7dnIO5hkRPIbH
         NqjMbb8rPzlpin3ImXv1pJw+oUuCSGw9AQqSDkzQG9HlRP11b05OMpk0tJc2q9uDqEnD
         EnzkLY7FTXk0TAhtoNeO9C4s0aXJ5U7FxrtjDuaHa6d8Ci/1aHNBVxig63/lBaCShmMY
         zwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755823; x=1790360623;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UB4p6nqgB9EJz4EKrWNfvZJy1eYlyCEmUs8uOozwbt8=;
        b=eSrOKv8LGlEfBEUPe3xuJxeMl0aUKNIcT5Oae4grBuWvQZI+oiJbfLEk01YR6/cLMa
         mFe2937A/PHy+OApLNfMNGAbUq2sECAu804kvMJboid9ORcJ1gS2wFBW7ur0g85vxjC1
         6IEhT9KF9wvkE4HOXFcxS5Jl8kGk5AHyyxSJ6PYnVkKCuN7SHfkezdfuV4XIeEWHzfY/
         MBH9Gmj2deYY4kN21CACounBr1lMCUkNhcJ9rpxCWjWbsZNUm8oVZhq6dm4mTwVQhf46
         Y0aq5ecNHNHfRbkNkVDPxxbIygC14j9KgpPD+WyPguFsXPCkLyHqbwjDNnQ9eeZiKoZH
         9A6A==
X-Gm-Message-State: AFuF++mQUpuOznwQJMnM55lAUlEsuMTQafAr/cofFZDOkmYvKh8RU0gY
	OhrCCwNyBVzzkZRsOPv2xx62A0SJLDjBBay7nde1eUBebWeJ7OVULOWN2rQ6UacYtJ8=
X-Gm-Gg: AYBFou1IqX785RPYFRPCaL5rp6NGvk6ljXDIqucP9edtCllWfor53L5K2ZnHZYZZiDB
	zfFFePi8UNHbmDObKj9lfuMknQCuDOykVLoxSP09ckxC8Hpn9UBIjJ3227KcjBwRqZAj7VmWeqE
	dEmCoSey7B4XVuqaR/bsarAtFvw+JczL8twUj2oD8FdjPtJtvEdji8+04ediEQOn20nGB771o9a
	9ldlEvJ1FUyAgTGePulVlMrgCIwXEX3eWhkHhghGFybKwmdiKkSyTMEFXHYdPu2bjP+UwJIJx7m
	izNXwewW58k+KkUlcOSogY6KYdXheWZLsqWK9xR23crW1wVYaClz2XAk0A/iC4Pe6yzB9tqqUlK
	J2aq9nLKnYMDzCq6P7/KfFPmi6L7cTGS3K+qccvvFypYLfjjKir1oNwi5xy2TG3VrFZwp33kRUn
	HIi1RE+0+i/cue4sF3vPpIbrUNkqIi1bjHST2HI7oPqG6RCAcY+AUEfYI4wkdMDkrt2uTNr/I+o
	3Eha211nmPUHg==
X-Received: by 2002:a05:600c:1f8b:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49fc5745fc0mr47069795e9.16.1789755822950;
        Fri, 18 Sep 2026 11:23:42 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0735c9sm12159755e9.6.2026.09.18.11.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:23:42 -0700 (PDT)
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
Subject: [PATCH v4 4/4] MAINTAINERS: add entry for the ES9039Q2M codec driver
Date: Fri, 18 Sep 2026 21:23:17 +0300
Message-Id: <20260918182317.143223-5-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918182317.143223-1-karl@asseily.com>
References: <20260918182317.143223-1-karl@asseily.com>
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

