Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8D822CBE6
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 03:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776138594; cv=none; b=nWuH8yIlMM50XZRtmfbMfK3jrYtDvnVL31+uQAUymr21hc3j31TO43FD66D4iNgF/LN5C5qbVZ5EhdRWPKb1oQtIPOt1UbvXc6zW6ShBxPWPPyvSDPteolARqQK3jLCZN1fDypCsvAHo9JlCxbGHUB6PLtTgkYfxig0UwO7d51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776138594; c=relaxed/simple;
	bh=kmtf5vt+sD0ZYZ1WFjpMm8wNrV1qGNum6vpVLgOH/Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IjiwYGGroutP1Zy1oYJeSEbqckefgYHwOhgilVBeg20IH5dgk7KIHXiOidbeOEK1XKsM4x3gvPDYFAo2vqpdpy0R7KI2ivci3EghC9WLDR1vWA+nOnustPg06ME4IJdTN7pytI99WGCBVUEsPGeCMLmHUw3u+OREmNBr7U0e1oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htfAMTU9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htfAMTU9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so623759a91.1
        for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 20:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776138589; x=1776743389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8nCCohEIByHxDLQV6fUvAFMSkLwCh9AbZE4mUJ6uPw=;
        b=htfAMTU9QaNOgtDd6LIMWx6zJNuOj1PhzfuKzzpIc7uJfk+UQ8dp2Z+z9N4RA2T47N
         XjhmK8rbkQ1ptUif5UhD3wM+m4HJLHqEfDDFwa2JdeBsN17YV8wrl7GQG1CpGxxMvCvT
         0ikW7PHW6zN9av+PNjTu2QXSWzrGPDT7bSoIQK6imyKPrcDVFWA/dOW4LfW+wlbpUqA3
         DNt1+jLp0kGZD/LmQKnOWJsXsvvl4QPhymS5XvzPuHNxwPPG/dI2fnsDv+LdgQH7n6s6
         /P2lCAPrEyTBcjX07a+vkE3M6NkoRErPtD8BldcMOQa3vSPLKqUhKYb3z4Imb8DodlDl
         Alqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776138589; x=1776743389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8nCCohEIByHxDLQV6fUvAFMSkLwCh9AbZE4mUJ6uPw=;
        b=hFWU1T45FVQ8MyHtVS5am/sDuAPDSVs35CGgeqnoKemHl7CXvso6E1ika8oINYo1XI
         0Itx5WxP9UMFjBUVmWwIjqA0vgh0aNJype5PMl1DNvMs7OUKNelW9HL/W6GrH/oeP2rt
         24F85jLXcGpvbQt7X+u7rDVB5LbsBjml5guNfwP05xCxbJPYkLti9AFHC0Mg/KXM5AXP
         KOZbmlTN5Cgw/AepdpLcCWWmHU+0C/ZxxEQK/ur0yGoilzxX/2YYCMMTccm8bvTiG+vA
         IYBVWUKVoPJjY9JdHHnqBcz/0LSoWHCRWnb7JeZl88fjvFjXO+oSOD5d5aSqFhsvf5CL
         SzrA==
X-Forwarded-Encrypted: i=1; AFNElJ8PfXjifwujz77MmhTjsj7/ZpWpyxl9HaeNVL/woG26+9KXsqw2agmxyoL9wimtTiQeEuCT9GC+TbWgwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZqthV1ARD2rJ9cpatn+kgwXviUW+O5/IFxIQH8W8LOBTx8jP5
	8dmJV7IComGWX3vvLsquWR9SfRSGifQ0ixqTVWupcU3h1uh4Ad34LYST
X-Gm-Gg: AeBDieu+qRi+0i91JEBys6ddZL5HmnGWw9e8y5XfhpIqM3+FJqQd+fylgG2pmwCALKa
	4clYeGHXlBastZOzW4HWNpb7mvO89w32LxhtFuE0+tPWvFbG59JGbAqTiDZb8m0SvEgpfG5xI3U
	L7dBh+HNShPDgBNq/Z3e0OuEbDrdSQO67s2ChQdeveDGzZpndP5lcmUAUZY7JKeFC5SeIwFBZP2
	UzU8XnrDmWCa7FhXvaFXtQIybBVIrmV+9bkL/8AtqMx25OfYOWlbd0YRmrzrWg31ofDShZ+T7eW
	i2dtx/a8M0N/HJgQlFz5tWYhcD+DOgPktllpBtCdvlQhG3OYdSIbrHwicVpFK516MVFw2Isf8Bc
	3PsAuQH4X/OoguRM2gTTgc5hSoikypLc911enbgJYmvUkgluADLdLrbrRWapZ2sfe/2pqt8vdL7
	THNb8qKUs58FYA2h+fDveMdOGcNxmZkcOVBo+BReLSHTWkkUY0
X-Received: by 2002:a17:90b:4a0a:b0:35f:b940:4e81 with SMTP id 98e67ed59e1d1-35fb9405096mr5084175a91.16.1776138588603;
        Mon, 13 Apr 2026 20:49:48 -0700 (PDT)
Received: from padmashree.. ([2401:4900:9393:1ba4:716b:b03e:9a18:6988])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fbdf9e171sm1765694a91.2.2026.04.13.20.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 20:49:48 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: k.marinushkin@gmail.com,
	lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	padmashreess2006@gmail.com
Subject: [PATCH v4] ASoC: dt-bindings: ti,pcm3060: add descriptions and rename binding
Date: Tue, 14 Apr 2026 09:18:54 +0530
Message-ID: <20260414034854.461661-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327121919.603768-1-padmashreess2006@gmail.com>
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description to reg property and overall binding mentioning that this 
driver supports both I2C and SPI. Rename binding to match compatible 
naming convention.

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
Changes in v4:
  - Rename binding from pcm3060 to ti,pcm3060
  - Add binding description
  - Add description to 'reg' property
  - Remove unused label in example

Changes in v3:
  - Remove description from 'reg' property
---
 .../bindings/sound/{pcm3060.yaml => ti,pcm3060.yaml}   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/sound/{pcm3060.yaml => ti,pcm3060.yaml} (74%)

diff --git a/Documentation/devicetree/bindings/sound/pcm3060.yaml b/Documentation/devicetree/bindings/sound/ti,pcm3060.yaml
similarity index 74%
rename from Documentation/devicetree/bindings/sound/pcm3060.yaml
rename to Documentation/devicetree/bindings/sound/ti,pcm3060.yaml
index ceb6f044b196..5a402d8b7daa 100644
--- a/Documentation/devicetree/bindings/sound/pcm3060.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm3060.yaml
@@ -1,11 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
+$id: http://devicetree.org/schemas/sound/ti,pcm3060.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: PCM3060 audio CODEC
 
+description: This driver supports both I2C and SPI.
+
 maintainers:
   - Kirill Marinushkin <k.marinushkin@gmail.com>
 
@@ -21,9 +23,7 @@ properties:
 
   ti,out-single-ended:
     type: boolean
-    description: |
-      If present, the output is single-ended.
-      If absent, the output is differential.
+    description: If present, the output is single-ended. If absent, the output is differential.
 
 required:
   - compatible
@@ -37,7 +37,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      pcm3060: audio-codec@46 {
+      audio-codec@46 {
         compatible = "ti,pcm3060";
         reg = <0x46>;
         ti,out-single-ended;
-- 
2.43.0

