Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A0D381E97
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 04:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287202; cv=none; b=JOyoUhqXw2bvmcPltBfwDU+EruR4Aeh1slO+2haC7HyPuGDJNB5CKLPfIYbDuhpxC36KdWpFXIGqU+IzwLeOl5ESfy8AHMji3VlZfxCE3U5kEz40swrdWBSrhHbE5/UdAdKVrvsYkcOjrOrTUWERj3GnanTag18IK18sLDI4VxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287202; c=relaxed/simple;
	bh=dmm5s5EvKAr7EaMlUMgpNClRMNSBub5q46OgcTbVtOc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cmeqnImL/JXUHrJ+70qREPmOSt1KIgJe/Yw868EWXJemLIqtJH7zgpjhk3nvnNcHdFCAU4DyW1V8slxEBmmRRLwujrvtvSTxTTOLQhwpjcT5IOaV7QXAod9TjsRz7zliQlw5655SRbMLmWfnwCXd1G/Up+p5SkueEeccG5mcHQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=YOxbLZ7g; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="YOxbLZ7g"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a36982a875so1025295a12.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 21:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787287199; x=1787891999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/TOCQOXC1+dxo3+w71MBVrhrZesKXF/A9anBAhAKsE=;
        b=YOxbLZ7g3lJuM9qDwNZDgl8+cIsQHwVx3Fr72icpMPB2wyS37U282Lq0XvKKe4x7uE
         zlJd8uu3xehFt8IPDcohvCEIxLPLc+OdloEJi/+VtXqdOL6DbHKtdyTiiiWSSVYSF7MU
         efqedVufvin8XoL2cgSM6amxLhKQmPh1lO1eeZ7a8jtgsJ9VtXGsUb5uHkiip+gWJTRr
         Pp2ZwHLcX2Pc544oSyNdBM/sC3J4IDsEOS5GyiiCoLyAt8aMZF8HLVeu6FZX99/LTgQZ
         I8h0NZtWkHhruSHqQOHOJuHXxglFMVjb+gfZf4iPS9IAXAm80roqL81OC/CHv1TVQEXK
         ljnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287199; x=1787891999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/TOCQOXC1+dxo3+w71MBVrhrZesKXF/A9anBAhAKsE=;
        b=kFyxjuhiiBSeLfj9HAaqE5xG+QE1SHwzU7b0ygkCn6dq28JsyatKt18nXaAmikwE1D
         5YDNTrJlPVhRSjBYAlAmSBRCJ0kNsV7JOYb3xSQTgN53XFW3DF86JmHkaH07/Ga9NPb1
         nlNHo2jjf/Pb8cJ4ed2a36jnWqAYVbtE8/5kc9T3UIT4gnONy33Y+G6NkFfz2+VpFtyd
         pFOz45QrObRPgmLGfO4Bt/74/Hm9jt4xQ+LF3W5gR6h6fKixj/ic1Z+/iZNoiM1N3UpU
         nTjQaE/TDFeG68+ecfetWZHd+QuXi/+ygWdEtxm9Fy9zPiP7QVPbjYZj+sdDnuSHEjDo
         5HQg==
X-Gm-Message-State: AOJu0YxrSJJmOe5gE/lHgaK0isToLoSoNVtHT3DF0JOLpEb4sZ6fJ6AU
	U4qdcNOV9LBYQR7n9fICa39xVFvYIyhX/eK9FjLUeBtNTb4pVcfHWBYOLcFHiZ2IOg/LPYNL9NX
	Nt4wCJk4=
X-Gm-Gg: AR+sD13N6cEDX66wKwphuj5apLlfaL7wXcPp/by51w+qPFt6KQaHgnCwS9eyR5C1K7z
	IBUmyseMdbwKPTqxmdEsZl9bufbbzdpq17ChQPm3kwF6B/MS1e2yni6PRKPbYlaHDLkxhS6WYV3
	1ZFN8O73R2RhE2IMuCsIgtovJ4PvZ0UT0Ep/PiLoKcUF2I7D/yFcaZgvvR8Wyd4NPBqMUicR2k0
	7UhT/quv21UMC/8h6MX+rAcEtvaXtM1f80yUD4SLhIj4jMmDh7azXqDEHIN9K0EKO0eSsBidQy5
	vr88I+q2M5gyYpbYeI/sxX9k+q//SnaL5twi4XwX9wgQnPizbydjorvFYtxwSrzP62Sk9JWhdu5
	DCOl2Y7l9tvmPZXTjoYfx3fn4VSLdEPwatEMtvCEugiGV5ToVTCi+AbewfGEAqinimhlg+E8RRd
	d1xNul0uMLMwhbXy2kfATxJwgfP7/2z2z4t6KntfGcHPiWyR8QKbk/RmpHohZX3x+9FANCklNzX
	S0=
X-Received: by 2002:a17:907:934d:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c246a5f6d65mr331787166b.9.1787287199427;
        Thu, 20 Aug 2026 21:39:59 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b5d438sm268182266b.27.2026.08.20.21.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:39:58 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: add ESS Technology
Date: Fri, 21 Aug 2026 07:38:56 +0300
Message-Id: <20260821043859.171871-2-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821043859.171871-1-karl@asseily.com>
References: <20260821043859.171871-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for ESS Technology, Inc., maker of the SABRE family
of audio DACs. The prefix follows the company's domain, esstech.com.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: rename the vendor prefix to esstech, after the company domain

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e..7744e4044e8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -549,6 +549,8 @@ patternProperties:
     description: Seiko Epson Corp.
   "^esp,.*":
     description: Espressif Systems Co. Ltd.
+  "^esstech,.*":
+    description: ESS Technology, Inc.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^eswin,.*":
-- 
2.34.1

