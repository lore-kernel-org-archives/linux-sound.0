Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DD0366075
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 02:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792377897; cv=pass; b=n4KQRF3P/7n5YEKtScjaFTpw0MelIdakPcGP79kWoeigYllfkMaZHwIWss82w5sBP7Y0em8Ao78eBnlWfYco2IuFR5BleOCpqe1Gmx3iYleDAAIkumvRp5FJz0hhmL27uIu5Bu+TODxvoW2a2yLzKai12J7LYl9xBC2qYnEefJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792377897; c=relaxed/simple;
	bh=mK1mpePIsAeGAZJq20u4M3rV9wIDj1ixhrUYy4+HpPk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=XGVAT63eOXgPcZfkEPZN2oj+ppwoZTz6i8MFTtLgsNZ2+ObACRYeVgyxQTX1FvIz0TgPEvjUOh/C7cMyyKY7sDzySIwhkdo0RZ61pE0tA4G62CnSJMVhzAm2RgfduxW2HP9innlqyK44cFdHQ/QuzK7HgX2Y7/pXzpncRgO/fAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1Cir9iB; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1Cir9iB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so7959155e9.3
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 19:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792377892; cv=none;
        d=google.com; s=arc-20260327;
        b=QjK/ZPXiBXPGyrXtYK3ixfXWWVIriVGtPWQA50sgKcvWdZZ1Fg78QrHW2bJ/hPtvud
         4ZFUwPtwH8i36BCKFCX0Kozn7Wg/FVcj+8mYoHk6tDIyno7Fs1SB4WEVY7tmFOQ72Z3M
         lC6B2cdGE7YIAzNMBvqsjsbAb7/uWokin0rqoMifKDWID23bwMO5p765C+gjKCFJgn9v
         y3roAouhbMDEggp7NiaRjWNRe7IXOCtrkEDVrVeyNNOBdo7srvEP5qlsjxwdiuLhJJcw
         G7X04JanvBQuTn3lGdX1CSmYuYMy1rI+VK3BBH1L91X5W6pYG867wglifAI5Bit4AspO
         vI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mK1mpePIsAeGAZJq20u4M3rV9wIDj1ixhrUYy4+HpPk=;
        fh=csoVGGiVyKqgfqOVla26MM3/iYeHvAGqvjuVD5ZGoYc=;
        b=MC0H6ZJLcH/gE5hawTk4xit3hBbJtoPnPBLApqjT0h/+NA/c+E53DyHddB0hy1o3nw
         PRmVV+uhzyn1FTDHvlj7/Gq8wZaYIIkmZsFq+K4ebOEXseiE2aXfx//9ljwTLnk1gIse
         69CCeBmw809AXQ9kcaAcPcGzKWgWVXHlYOgpdH1hhovnu5ruxdwgvtlGYlwB+9Cx0p5R
         zK4vNU4NMa0Vrq7kY3Hzlw0x9KAf9VsqrIl+pkhVI55GoJuRRjVs0qXpOCphubWnv/bc
         OlnAF5tfjN5NRBfzb2jrFVy+n9BbQkmGhV7PGyiAYc61BPtBb5A6RiYzL1wdlqqJIQKj
         4VWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792377892; x=1792982692; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mK1mpePIsAeGAZJq20u4M3rV9wIDj1ixhrUYy4+HpPk=;
        b=P1Cir9iBC3WNMMLD19BW2uJZy7O9NDghYS8SVJt4l9oljPlllnEzrOilKYT4+NaRuW
         YGYdH3tlg/+Oc3eVbgTtwFTP6TrV3ZWwD4CDkoAeFFbl7JLSBSNk5MFq9Xo26sr+KL0m
         WpPxdgEgl2HsSWSaSfLD28CvR8AMSVb12IdkH5OP/xQ2FcbQ7i7R6xKDRLMP8PyOl2lc
         5Er8LptnvSCwwBePpPzkKwkofh69pOY5QBYKGyZk66aey3p8jcjrvAK9pveZfta3ccEv
         +rHaQ0jJb2fgW5OZU2H1IuaWqpV2rIH86hLYkuRlB2WZZsJJRSmGpNuJGackkTPnqPn+
         mYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792377892; x=1792982692;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mK1mpePIsAeGAZJq20u4M3rV9wIDj1ixhrUYy4+HpPk=;
        b=K+RY9f41zCoCAN4miEmxWXGszXUKpUv4YJAz7S/nlTv8G8z+b21qUo9cEQP1CqyvaL
         u9+VTcKSjiWL5T6K/0iIHkbiDJ0HDrFScVcD9SgTwZClMkGjsyxtiwilbZZfS2UyMQHm
         6zyuOcl7qTfC9NucLxcA65t8BREaZd6jPIIWY8Zr7mL1W5QYhqt4eIfkJAsYAzzij/vH
         JIphjDGJ6jcL3vEZVrvl6yRl6TdbWD0vgxJpLMuyAZwvHxCmk9VDs3nT32iID59IJp0F
         eZsW0LU+gHOb0H3y8s8utz0aE48Yf9O/csMn1zFvQLWx73BXYPUXXxCtZJer5I/LAQwa
         q41w==
X-Forwarded-Encrypted: i=1; AKwUvBw3/qSVZpyGk2YGVku28gDs5xWvYHG3v0wmus7GdcwkpUMcof+rEsuthqNAju6eyzWDgemuKivpl0mfTw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZcYoHkYZKtp9dFtpz1P0+8knYTkpQ44PmGuAFOdgc1diDgu+B
	9L+9cC2X1XMYfRKsWIIkQSJ0J4QWw7S9pfixRySdcfnHoN0vaeaCEbG+RYvtmLCwu3UtGeIzwox
	MVxT2Ps3dpRmamj2K1pWgxkUY+0WEzWE=
X-Gm-Gg: AYBFou3jOE1c6bawhYRMggIfPVvOPELpAM1vZi57fouX5tufwhTtR9THATKsJP2YFMQ
	Aqrb69bTBnRFUGctpGAeGxUT0Szo5jOXIHt7ikEV6X3slWO7oN5FXo0bGMrOBAZTufPbjv+BpSB
	Wb9t9hl9Ruqyk6I18WjXl/T+lf1CYUFh7CoX5JxOfNcuFW0Kx2PIf8feoST4OH0qY/SHZGNdOWC
	Ajy12ya94E4eZ8zXbza/+iZKOM+oVMlejbP8EgRkMIb+W/dxIERFBgBe6UkZxrZ8vhTxgAZac2/
	4kaJYLYkRXzq9j739XpH/yHUqv1S8ZYaQNGUobiBuxrTSvGHLCnPKawNaLtfzcSVrVAL7/u761q
	tkwqeXFhs+MdjBE0Yx9wLb6DT
X-Received: by 2002:a05:600c:6207:b0:4a1:e3e4:c438 with SMTP id
 5b1f17b1804b1-4a1e3e4c4efmr52874135e9.26.1792377891952; Sun, 18 Oct 2026
 19:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: HyeongJun An <sammiee5311@gmail.com>
Date: Mon, 19 Oct 2026 11:44:37 +0900
X-Gm-Features: AclHuK9DGYuF9YVpaV_W_mUR2xaHiuGLF4Pgxek6aHhEr8O1PZws4FNszE2Bh30
Message-ID: <CAJciObGfAwYw84mVU0knzJcdLkatWsccsijRBT3E9b25CKyF_w@mail.gmail.com>
Subject: es8326, es8375: controls that write each other's bits
To: zhangyi@everest-semi.com
Cc: zhuning0077@gmail.com, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Zhang Yi,

I am adding a check to ASoC that warns when two controls write
overlapping bits of one register. It warns on two Everest drivers, and
I cannot tell from the driver which field is right.

es8326: ALC Capture Recovery Level and ALC Capture Target Level are both
on ES8326_ALC_LEVEL (0x33), at bits 2:0 and 3:0. The DRC Recovery Level
sits on its own ES8326_DRC_RECOVERY register. Should the ALC one be on
ES8326_ALC_RECOVERY (0x32) the same way?

es8375: DMIC Volume has shift 2 and max 4, so it writes bits 4:2 of
ES8375_ADC1 (0x17). DMIC Polarity is bit 4 of the same register. Is the
DMIC gain field only bits 3:2?

If you can confirm, I will send the fixes.

Best Regards,
HyeongJun
