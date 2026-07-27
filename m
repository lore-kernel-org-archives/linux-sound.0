Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFB73C2BB4
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178705; cv=none; b=RaSougnA74rrhoKyf36RB9kNvF0ChqArBnLc+1HgOk698a6vacvvf29FdhPQW9qdewWOIucIKv6Gs1G3kGxNBXlUToWvWjkbQBC0MJYk38U2p2GTYHijIw9V7M6E5L6YgxhEYD18Yavd2cJBn0tBxB5h0Z/jsRj2LFtyD6Gp4AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178705; c=relaxed/simple;
	bh=RNtC37zOpHstQuV6sNG5EMAYqFZvbNq/Bx6wcnohDYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzyiVI7OkqkoWgVS96YdeVnueuCvIOKLmaIzzrxFJQjvcJ9xBM1TtqudJFHD5tdXlSJEaMzYJzDnAg19OTbBHZzwzCAEZr8M36sLbE93bVp2yh1Bq96FYe+XYBHRcmL2hrYyPz1II90e2npWYjfT8DPAh9pvPWobn7JaOOfhFcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j04KQqTN; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j04KQqTN"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-726840fb461so749419137.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785178703; x=1785783503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8JFxz5EfONgp0uYH3QGBbFN0zrTrYZvMAfW3kWL/zY=;
        b=j04KQqTNT9I/zwx9EsfDBKlQ5uiQD6ByM3QqndeaymqOsaV5uXt8UzfGm1CGP71/5F
         oIeoNnV+DGCl0mD7oNEmsMe8PY9osjNXNZ1/fPOLraY4+yeV/hy9o7MIEJTiltYhClvF
         BFKkm5Qb1o2GMuwvEMReJf/t7i+4m9fKpMqBBFc34qUSnT4MHwYancTOzFco086szDms
         9BY8HzISmlg8cLfvBAkTfj+6phFYgJlZQSD1Ns1TnYBnQum4eLmpKUEuLOOW6Y7d6Ptn
         z/E0R0VWT40qav0piZjVJeBCbH2HiJJenvwl7FG6bieK6hBBexvnrgY8FsxZugSXwLLb
         Uh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785178703; x=1785783503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8JFxz5EfONgp0uYH3QGBbFN0zrTrYZvMAfW3kWL/zY=;
        b=hBoyFrKKIi5YN+NC7eKNFqkIuSJmnrprnreFSyNkjcjgz7zb+ZCLkDOVkqICUD8qcZ
         GzIIQcM3+RiHNGlQQ4F03Hnosj6eWUTwZEk6yRvnnfd+ofoKHLFU4DP20Th0MKXepMQb
         ez/wGPU6xvNt0MIiFDBPeszLtu+61ODyyGqk6AMRur91pgZltZ2m+SDi9z/30lhTaIuC
         RBRfKy/t0mriPYGueCEQJzndw+rCzz4pOdBGBRtlGzX9Iaudwpn9rG99/lmHerS202iz
         HPWiYs5BDjilU7znzMn74tPaXNp9O1Dwwyhr+oi5vnBKM9QvC2Qroxaiy2ubMA+XRFa9
         cUZw==
X-Forwarded-Encrypted: i=1; AHgh+RrW4x5isA8vE45VtSIM9lPhfdt+9xXoMiRAYfL9P7a3FQvg9p1U6e/K7UHKhem/HbFLKmnRelO+5cq0hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW+LyFM1iZekXS95C65ol0aLi1hIMZ++naKCaEQXEAe28n3Xyb
	2Ef55Cd6wEPXausjkLgU4JV1LY8l5FwANwuTuSwEcJsq8Rshax7XNTrK
X-Gm-Gg: AR+sD121+Uk1lTd6BFutlOLtuuUEIVv+kK7EC2jnUCnBdT0j5tm0Y4vQxwmPpkgtkkO
	Nj4Kj2WYvcJgWESlYBnOdECCCzksLsBv8o+e2e28qwtrmM4rwhLHGw9rkT6dUWWk93H6ToaajIc
	30JBlQE6JWz1XEQmtkLVJf0AGnkjD8uPN1XMhfpe7k8jh/xGqHWrVq/br9GW2N8ETcO0EiinRMc
	vc5t1hsyNBvvDTMPMNzsBeTDHBKO76ozTJ3G+CzrixguMNZ9cAHbq4sdXMijq1cVtQnP7JGylTN
	1+9O9o39kjL0Wvu/XoSazCTAYsRvNBxDmRipmFdeOwkS9TwX8HXeoSFI7zKWzyraoOY5YnZBP3R
	bFSFep3s+G5FAC+PaGoys2za0f4ttyjje6WiSozYqAnFSyuGqufeAU6OVwZ1b0LMpfUHKkqFaBm
	URIXQe/WPWOA6zYbtDnZPg1pyvTDWSlRkmnSBVi/elIVyR8xaBD5W072tHlesS7UE0hhoa2kNjD
	QNIWsvuB5pG5kd7f21Nithfhyt22uoZmVrcWvVlizHHkCUz
X-Received: by 2002:a05:6102:5e95:b0:740:32ae:8ec7 with SMTP id ada2fe7eead31-7542547a5f8mr465862137.23.1785178702885;
        Mon, 27 Jul 2026 11:58:22 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:21e4:da15:d321:6b72])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-750343701fesm6294833137.6.2026.07.27.11.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:58:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: realtek,rt5640: Make interrupts optional
Date: Mon, 27 Jul 2026 15:58:14 -0300
Message-ID: <20260727185814.2599488-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RT5640 GPIO1/IRQ pin can be configured either as GPIO1 or as the
codec interrupt output.

Some boards, such as the Firefly-RK3399, do not connect the codec
interrupt output. This causes the following binding validation warning:

'interrupts' is a required property

Make the interrupts property optional to support such hardware
configurations.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/sound/realtek,rt5640.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
index 2eb631950963..922fe161f4d7 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
@@ -135,7 +135,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 unevaluatedProperties: false
 
-- 
2.43.0

