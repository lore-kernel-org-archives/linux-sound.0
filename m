Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136738;
	b=mQKwLrEQtQ/UlyXkKxfNsg46K84v2aYZWXa+deBRSFDv8Fa0zY0TLvendeMLHiWgCMpd
	 IxPYszaS89ojkAG8YFo6gIgQGs0lWf+fJAR4akAzVIVCmF6E+15dnk7tM1thyThHigSSh
	 IXUvMeGFB2bACJ/WpN6ZsgA0gu3HJaI6vyzSHUpnCgUk7ARBxYoNUm6HD4sFRiyUBdPo0
	 ytbjKS5jaEDyKOk/rWTDYM5mrcz9szS7RkHtqrVH50tS4sPui7JMvFN7spA46u0PeiSVd
	 sNXr6pzr0NYi2PgteUMnTxh8jHEvF82Eb6P521nZ3QEiSxFvvU0uo9LsT+gizrNid3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=s8PGc3rV/nkDLjOBf3Blk9H7tWvd1KHQ/b+xwHLjFYE=;
	b=Q9ws4mEaNvJ3ijGbgtBSOZFwIkuMayQXivSVOIpBUqJUeWcxXcC9Cqf3t4Oi5A1KeRKS
	 OvHfC9ptscHrXVmdtDGceytpTo03er7K7Ze/EioudpENTkA/K/8u4kDZhwu/HT5aspr1Z
	 LQZLKVM6arWXQvmJXftuTsWZdG70sL2MDWXqG83WU0KhwozkgxPKF9UY4YpTk76fkp3/q
	 8NUyNgfaXee0Y7UGtwrjTRfDnLkRtjcF4kC09rmEeXGhLLQY+xQ1g/55wC9yJt2TpUv+Q
	 M0sSM0TRUjNmcR3t3CuoRakpZQRYYUPeoM+Trct18ij7l0ayYQv3rbxojFY8iFoyhFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjfnSX9T;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294E3606A336
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 21:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 294E3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjfnSX9T
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3550c917fd3so460909eec.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136737; x=1793741537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8PGc3rV/nkDLjOBf3Blk9H7tWvd1KHQ/b+xwHLjFYE=;
        b=sjfnSX9TUcA+Dwn/QuytXXbxVFg9QT5pJdQjYAD59bkWmVGLRXIfO/xgfmWHhM/OzV
         G0B8nZk4iPGQFtsnfP0wlJxXeTzjUXY/uAoPWCSS4E9DvxIUxlmImpWe/ekR8wGYoO6p
         U77vnURTnZsfv60X4Z9KDo43QTcIdDe/q05Z/8MgiVgXnKc+DO1N6/BqbW6jLXFNleRd
         2RPh9kZb59HvkJpGxKAcuWox3r3sXwE0M1YC9P6P1fyWN2BxWkj/LQxNqTgeDXGlxnhe
         FZ24IZrAoS+2dwE25JBB+L3pS6XPtDztNEgs/BSYpCEzXrCnv/+rEz5m7iUEPu/JZxtT
         REwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136737; x=1793741537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8PGc3rV/nkDLjOBf3Blk9H7tWvd1KHQ/b+xwHLjFYE=;
        b=Ys9ePLfm6dzDpWN5yR31DEzKhhc8CMNl++/B+Jfj/fUdF1gdUM0f+qbV7PFmJPpAdS
         QCCVoNIZZU7BxSHAKy7dRJhDFG7xLTQGWiF0nUYt56pkSIGj4xz9uoSAxPijdXwXik26
         jmy3yDY0pfv+BTHVvkmzOD0035zFtSupinZRgtvCWHOkR9RdpowtN8v2sDAWmlcO0z5W
         0gMj7OMOupjOKr3V6iDYWcQB3ZVgN4hW4sCqJRB/tL9fz+G7CZVL5QdT1m52KAPQ948S
         cwFx5VTim/PoHaeZgog0B2FeIEiLYr7+HIqyOD/Bywjnz0RTr0ck32/9o2myTUyfSjdZ
         pZGA==
X-Gm-Message-State: AFq9FYL7ydTVDqA9oxz2x7r/8VWPh/dnrlkxf1QBpyGs2ArUeWPKp59+
	ugny1ZxiYb59yCMYxGaV/K4s6shLYfM2C17+606t20N3reblslcxWVWl
X-Gm-Gg: AYBFou0rqNHmARfd7PfDJUMh/G4vlUKht7t4QoYjtSsCxxDBUPajxJ5J4eqPOhrtTct
	5/9nIey6UMsNbcTbSqPo4zumrHcKswU0R2ibcWt7np6C4PVbH2VCv5bB9O1qTr5O0S1TwL7YxL3
	OPvXeIURHRpdW+ZIAXsbRgZKTgViwD2l0usT2+2xiUCQnjyIgd2TIMasraw8UPUMz5xGs1+GShz
	RCfbMLS4/GPHY4AvTDUuHqZcxhcEfk3UmNEwPOhO7Dykoy6hz7k1hEwH1CUK2IQCMTJFoibqx2w
	eSOLqXbTDBcad4BgfZyHZmq/2oexGaOIU7ke1tdss3nIPe3TlgaqnbL3Qa6bWkw8JCmLPzHoZ5K
	u3432jskFEDFJgPtzpZ+9eKwpSs60Bc7dY9RXAvXpe6xkHOkQIcZ6MPIT+whMgRm/g4zTWZCXvZ
	LaKSZIj6hmx+PtEp/5dX7PLC/pMZkAdib8xL2K0ptO9zqH+tI8Jd4Wh4XdzQA9gmB1YYa95UeqQ
	vylxHjhauLDPOEwLfC/4URZcFyv0Hj8MfcQz0iLTmqxQuBjlI3YXOj1Mx90Te4OR2Lgm9+kJFvU
	Wsw6pON6VtCA4+A80LCv65s4IiSU3iE8mbqvTYYZx2dJ
X-Received: by 2002:a05:7301:fa0e:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-36a203d417emr1224861eec.23.1793136737039;
        Tue, 27 Oct 2026 14:32:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm61693125eec.25.2026.10.27.14.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:32:14 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:32:09 -0700
Subject: [PATCH v2 2/2] dt-bindings: mfd: twl4030-audio: document preferred
 name for external mute
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-twl4030-extmute-v2-2-c7e0c90509a1@gmail.com>
References: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
In-Reply-To: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Proper names for GPIOs should use "-gpios" suffix. Now that the
twl4030 codec driver has been converted to use GPIO descriptors in
commit 178c169a30b0 ("ASoC: codec: twl4030: Convert to GPIO
descriptors"), update the binding documentation to list
"ti,hs_extmute-gpios" as the preferred property name and mark
"ti,hs_extmute_gpio" as deprecated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
index c9c3f7513ad4..399693bed077 100644
--- a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
@@ -39,10 +39,16 @@ properties:
         description:
           Enable the use of an external mute for headset pop reduction.
 
+      ti,hs_extmute-gpios:
+        description:
+          The GPIO specifier for the external mute control.
+        maxItems: 1
+
       ti,hs_extmute_gpio:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         description:
-          The GPIO specifier for the external mute control.
+          Deprecated legacy name for ti,hs_extmute-gpios.
+        deprecated: true
         maxItems: 1
 
       ti,offset_cncl_path:

-- 
2.56.0.307.g5fe7bd680c-goog

