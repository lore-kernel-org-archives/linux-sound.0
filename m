Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4C8389452
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 06:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207210; cv=none; b=G7oFukbwBffQiWtgKzEJbV/pV1WAnR3Eaofm9WKZBz4kOsLtOU7aO+zlMSjk3f8blV2tuUx+EDE1BOID+c3bxMn0sboz6vOn4lsLXlfNZxcEpi9mPejjJZPzlkJJ/vgW83WDkTgINTEhfaUWqyyI9mdCzoT8LGS9FGzuZyGaEbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207210; c=relaxed/simple;
	bh=Y7FWCaIl/m38lorwaP2Ul9eKdzFyPd2HGwBRLZPSrWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1oRc6CbnqqIje9wGmX10rNtmluUCkPR+pjOEx8J90znWKXwbwYxH+PJp86gwBhh9c95uNhmS0acOUTGncRfBLRludBIWIYBfHMzcJtKzg71G5Re3WsU1AKYopnBfMDKu13B3ifj6Wm0YOiw4XBMAPjzBg1yFSsD9ZzAMLd6s20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=ctGQFP4l; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="ctGQFP4l"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1171820f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 23:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787207207; x=1787812007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XXp/MDRgAGHd8zWbW01jplCVgKPQQ7sYClUxWbMVy4M=;
        b=ctGQFP4lua8rThfVwnevKK26YGJtMyZQjm1zuxOcrGnYGzOl8VPgoUT/OW7pZh57fx
         MVbhLPUSa9IVN5G8tEffrauUp98MXZ4qStLG0YYa1lZAE3CK/2dL4pHDoGsrtJLdA8Ns
         BjgYwjqpQQ4ASDW4CCM5mczGm5OA8kQK+x498q0Ghuvb8ixnsNPiXmhb+FNO2nq60niL
         2jjWSo/rH4E+L5HBlsCjqBDb0rxmG5Mrcnxjnv3VFhj/yh5D8H+NcEck6iiP7cCsMRyk
         TknuRdoGv3slI+W+3y/yZ+LooEMHyghuAkxJyVTZ2kwyyx315I99hPG8ElP35UtiaZMD
         tWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787207207; x=1787812007;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXp/MDRgAGHd8zWbW01jplCVgKPQQ7sYClUxWbMVy4M=;
        b=joyN+Hh2/AtfkzJaU/CRlPjJl5ytuHtB1ECU8ZpNR4d0CYyGeYs2VRX5xRl7sJdcgs
         +xQLjN/RbDxGZaOzt15CVs6nEyBqhPde8zACb8DcWSrNWXRXLkZp01XYCMuMDyXast04
         kGxasZN4RWSg+kH4Lfp8Xhy+eX1fhXVP0tpo60PTtdYC3hitxv21my1BwxRiADcQma2r
         rPk2qUgl+RzounKbY2TPStbfaPhv5LBZTCrBCq2XRP2DUVGY0ltLf7zV7Urht1H13XCW
         CJW0nbI6iu+ffDjv7NArYCUT0u8EhHJ0kMIqDZFgF0JtoF1A3Jspsph0Hc3Dbk66A8he
         lCjQ==
X-Gm-Message-State: AFuF++kqGQKj1Paz5ja6ETZUrElpbpNkjwZsoRgYGew2i3OeGi715Leq
	8SWR0tGUJzjO4tY2pUd4wahESyhJf6BoKtg7fzv5KkCRM8X2k1Jm20yc7KU8AMkulu0=
X-Gm-Gg: AR+sD1098l2E7Am94b5vQeA0kdTUvWFXG7tb+w5bm7jFnwMbP5yOqwbE/uSGGnAkFjH
	OkEfYGKwbloMV/x1ws7xz1kUFkWtctEMkEZrAiRVr9QK2PADT7vOSADqA3DKCayfqgixsVGDxNN
	3V2rDjg/K94ToLr+yW/vzHv3HE1695O+b0nRlrJWgE53TQgYFwxEJ3nQMhkulpsvTGJf0kmQLqs
	6K3U/0VwdofckQ5X17qbzrfrTICje6iHYdaokQtn5NTUQ1i72oJXQlYniJf9wm8P9uNX47xM3MX
	pE50z/8WuDTmonuAfJX6N9BBnYql5fhRiMORoIDvHSlc2BvFvf5AjooxFMhyiTrQ1NOo0mjKvwt
	oO6065t6ba1o3hlYHCQX8hSKbSZvPjdl8xh4Lq1VBMzs8lyjPa77uBxTGSC0VCtIKP0xmf5OQEf
	vrIjXUtR6NNsDenbGBiQjcqQ9yRn0HwMj8oMnGFh3cIIGYHbhAiur0hpMAuYxpSkWyXTyVYRBhu
	lc=
X-Received: by 2002:a05:6000:455c:b0:482:bb55:8bda with SMTP id ffacd0b85a97d-482bb558d4dmr2428596f8f.5.1787207206966;
        Wed, 19 Aug 2026 23:26:46 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.23.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441725sm9980054f8f.3.2026.08.19.23.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:26:46 -0700 (PDT)
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
Subject: [PATCH 4/4] MAINTAINERS: add entry for the ES9039Q2M codec driver
Date: Thu, 20 Aug 2026 09:26:26 +0300
Message-Id: <20260820062626.39218-5-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820062626.39218-1-karl@asseily.com>
References: <20260820062626.39218-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add myself as maintainer of the ES9039Q2M codec driver and its binding.

Signed-off-by: Karl Asseily <karl@asseily.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f8253..7014285399c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9625,6 +9625,13 @@ S:	Maintained
 F:	include/linux/errseq.h
 F:	lib/errseq.c
 
+ES9039Q2M AUDIO CODEC DRIVER
+M:	Karl Asseily <karl@asseily.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/ess,es9039q2m.yaml
+F:	sound/soc/codecs/es9039q2m.c
+
 ESD CAN NETWORK DRIVERS
 M:	Stefan Mätje <stefan.maetje@esd.eu>
 R:	socketcan@esd.eu
-- 
2.34.1

