Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BE114A60C
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730804; cv=none; b=tA3pHPTONs6oY3uymOVubRRJbLBqWhZC5wDsMSsnpeWD7z1VxMNDQmvqZ72s1nTZ3dPJPRS+YLKp/nksB8g1mkRbscegF4CXAmoYHRz7FkUzUg/7w7Na6MdGfzt8ptOf1lvoKJijksO9R0RhWS01+mrDcfnaerNYSWG5N3SEEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730804; c=relaxed/simple;
	bh=8RbVPOBei0OznzE5G/YXwRUpXk7hMjZJk5zQXe0oe58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l8fZv3wRsqkt7FpcrHieUBHj+ZBxb3ltqLBWCLH2wiPSd6uPhhIbCzk6SvbJfnaQkfoGE3496eRi+Ca4nzGuG1whN/5ezmPeG9aSkvEaZAb+m3YXbowgrhxyVPh76P+tqC11ar8xR1dV9uhWhbvRqjS5pFJ40yb53VQtKVQ9Fks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Hn0OW3Fs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Hn0OW3Fs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so7797355e9.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749730799; x=1750335599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnpY5n5H847YZc4x43NYnlAWf5mCmkrD40/z7KC399w=;
        b=Hn0OW3FsucjkLFvDW9PpU1039Agkb1DTZ3FgmPl5+rWSFJp+6Fg22iEDwV/1BQJ9io
         yFSSvN/RxN7IVajBWP6sqszSYn06hDzZU5hKOecpJVdBZNkNIZGn7mX3pyxdOn+lMFeu
         DJW9PFcruci8Tear64cbznyolPM+pPrBNy42Hx9nlnQE0sMhzpAQiEgvjZeMPfK41rJ6
         sm+65EejJKZvkNEhxX3AvCxaLl81MA7yklt7bkYrRApEqaoY/zaG4wBmc70px4UQfDpc
         02e/szdfq48iHhyJPqCu34egRr7cjdhOVyBHACrySjB97MhmKSjsb0IeOKIYuZHQKWFi
         fAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730799; x=1750335599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnpY5n5H847YZc4x43NYnlAWf5mCmkrD40/z7KC399w=;
        b=oEjl2fMxzpbKqVb+zVPVy5fRq5NDkGNux6BUilwNQFBpA1Ewbu70j8jgmhnHrEYLrD
         n8KCCSwhaUWO6qXuhc2vj41OJr2N3JSu/V0LRAF3bB98HklAEMnuVHx1uvOqAuf7F3tl
         DYgQzjTCpfL4qn7iMl3SDQDANfAR7HXE/qnA6UeI39LxEENqhVYxML+TeJMMCPdqeOTo
         5ONeRnt1dUBOyVX7JWfSHKWBhz1W/MPqU6SxoVo5te10ENxSvqtDDYy88rrKERrzYOJ8
         PgTZZj/Sqhi1bzG2Dj5sGxYbTem8EBevPrABjeNox5EapB1U2kiQwfnVcVRvNJlu8yNk
         Z5kg==
X-Forwarded-Encrypted: i=1; AJvYcCW9zu5zlWCnV3ABXzE3z0y6sT25GaQcRAFwicWioSMDzMkdVD3yAYxwZ0Vz4I9UZ3TKDpy28Ux+kmSCFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzNr+24o+gBf6DsvkQG+q91rfw66+bNOt7L7fgpsSEwiud+aU9
	Ta9Yh5owPkvbtakAGo2SovzlelA++ELRa9LPPjpDixLhSqKrjtI7r3O5fVwySfWh8bQ=
X-Gm-Gg: ASbGncvhVZFVxQOa2iQ0yt1kf02TEseWYrJ0vCkg73ovI55a9myoOpgTSoeIzVDlFdX
	Y9/OJ9goSSR6A2G/ptVJs3rmzYjoypf8F1rcPqOVQ9Jf7plIZ/bQBiFRf9gqLUmKae+/WxaBeOL
	o0O3kOp66oXFq5J1B1pIawiyGKdaffizmHbzNmTkELlpYI50qOeRwXHvDPBlFlI0PFalgkAoWQy
	Uv43X7XlfL0p4wVNcHtre4qZEUyzarCSiDYgKNuD9ipsoQEOlR28h1Xvf99DrdGm95mMVoXQM2z
	SPdo1ftHsts304Y1XNJcRM1BUrtxeb667PTPSNU4VCdieFr906CMFdJi
X-Google-Smtp-Source: AGHT+IFSzUejJlK6IyeUiW5zE5+TQka18s8fQhdo+fmao703u1gkkqQvrjQHaT6gzH2kW/rpvnpnig==
X-Received: by 2002:a05:600c:1d07:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-4532d2f2d85mr28726825e9.14.1749730799508;
        Thu, 12 Jun 2025 05:19:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c229sm19636035e9.6.2025.06.12.05.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:19:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 14:19:53 +0200
Subject: [PATCH 1/2] pinctrl: cirrus: lochnagar: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-1-2d45c1f92557@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Rhodes <david.rhodes@cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5iiQBlbQb60z6cXs+sdVO0QLuKZEA2otl1hVZPVSDYw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSsXtVAvnc6ZbsECs27O/Tk+Pzm16vppENAyoY
 5F5Si3P6UGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErF7QAKCRARpy6gFHHX
 csI+EACJogamuAI4Vo8DWE05XtYE75MJ+nfVzg08xvIgWf5oRbngyJk5tMligI0XJg63UEZQQsh
 aCzMiQS6T4in1wgfm9t40C4UinDe0gipPIdLfh78h+SFrl8PnT8k/m2moi0k0A8hV/MQFB8gm1U
 kqz20zH2maRZRrx5Um+kGrjQ2FmtIpzetlfSTssthDqvUVYD+48icdY1QUc0FSl+SgGLWWKf2IL
 wXJJXEO8/PkOqldIlIdUhiw1fhS1wVPG1s+HqgGtgtdE+30PLJOVFRih1Svh6l+F5/S/cucX6ek
 fNO9Ht+lgX/0Cwg1/wp01zzkEKus2eSYJeDUiUnG5wPvZyvfvZfSG/7Sv2B7JzK7wNM1MEkETnV
 VYxpvSQ7roV3rIDvPkgUKiSIIlz6kGBITt3gAYKpDy0rx78IBLWd2JkxkTvxuc3Ki3bVD5c2nuY
 6V+xGhWSi7cW87/UUiX195l55IJ4bJxWTw4aRoMLB5PV4ToQpjegPVfgdN3Wx6JFs5xhRqsIZ3r
 macJyRlB1ZzbZ7mrEvKpFD8R0wwcMuVpzmhJD8o72XFv8vWKCtRzBH8qfgpROi7mdPRttx6VCxV
 Z7dhxhnlQVcJfNSvaDewtlOsLFIDRxnSSiiO0k8uhk9dkIxV2iFTGDXy5Yo8qAp3ZqIweR4gmDT
 sSaEo63pReCpuXw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
index 0f32866a4aef2c84b99f3c56374d8dfd9150b024..dcc0a2f3c7dd56d3975c54ef3dc2726b938e4480 100644
--- a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
+++ b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
@@ -1058,13 +1058,12 @@ static const struct pinctrl_desc lochnagar_pin_desc = {
 	.confops = &lochnagar_pin_conf_ops,
 };
 
-static void lochnagar_gpio_set(struct gpio_chip *chip,
-			       unsigned int offset, int value)
+static int lochnagar_gpio_set(struct gpio_chip *chip,
+			      unsigned int offset, int value)
 {
 	struct lochnagar_pin_priv *priv = gpiochip_get_data(chip);
 	struct lochnagar *lochnagar = priv->lochnagar;
 	const struct lochnagar_pin *pin = priv->pins[offset].drv_data;
-	int ret;
 
 	value = !!value;
 
@@ -1075,29 +1074,31 @@ static void lochnagar_gpio_set(struct gpio_chip *chip,
 	case LN_PTYPE_MUX:
 		value |= LN2_OP_GPIO;
 
-		ret = lochnagar_pin_set_mux(priv, pin, value);
+		return lochnagar_pin_set_mux(priv, pin, value);
 		break;
 	case LN_PTYPE_GPIO:
 		if (pin->invert)
 			value = !value;
 
-		ret = regmap_update_bits(lochnagar->regmap, pin->reg,
-					 BIT(pin->shift), value << pin->shift);
+		return regmap_update_bits(lochnagar->regmap, pin->reg,
+					  BIT(pin->shift),
+					  value << pin->shift);
 		break;
 	default:
-		ret = -EINVAL;
 		break;
 	}
 
-	if (ret < 0)
-		dev_err(chip->parent, "Failed to set %s value: %d\n",
-			pin->name, ret);
+	return -EINVAL;
 }
 
 static int lochnagar_gpio_direction_out(struct gpio_chip *chip,
 					unsigned int offset, int value)
 {
-	lochnagar_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = lochnagar_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
 
 	return pinctrl_gpio_direction_output(chip, offset);
 }
@@ -1160,7 +1161,7 @@ static int lochnagar_pin_probe(struct platform_device *pdev)
 	priv->gpio_chip.request = gpiochip_generic_request;
 	priv->gpio_chip.free = gpiochip_generic_free;
 	priv->gpio_chip.direction_output = lochnagar_gpio_direction_out;
-	priv->gpio_chip.set = lochnagar_gpio_set;
+	priv->gpio_chip.set_rv = lochnagar_gpio_set;
 	priv->gpio_chip.can_sleep = true;
 	priv->gpio_chip.parent = dev;
 	priv->gpio_chip.base = -1;

-- 
2.48.1

