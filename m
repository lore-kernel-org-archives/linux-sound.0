Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3333D69D2B
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 14:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728052097; cv=none; b=FAxiyIBxcpWMwMcijVw4mb51pyinH0inilLj6rWW3Vgo/C7+CMfDhfeNgAo50mg792X6/3is4+L1pMk+7LfjJOvi4cziLNvE0/XOrrsETG3eCkqaReX+yaSSRPOQ50t8Cz91B5dU0y1Lcuyjq+YT2BodW59AvUKmpIUgQF4CtBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728052097; c=relaxed/simple;
	bh=D9T3qhcglVm+E5H/Y1cqcOgDni/g6udaIH7wCzg3NQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nL4y6G9N7kJprVEr2LbBo9FJwM7IglCH2NbEWlFh6ipF8+tWPMGtgKvcBmVHQ9Q6V/cotQizP15GPT6DW9YoyeWGKDS6Vhj5yb3RfXnBS1D2MrY4NEFM5WlsuXuLj5p19q1+kfaEQ/yTfSTLrxHjICx9fmW60dQNUbj2DP8TM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=r8LUwFjr; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="r8LUwFjr"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 4705761ADE7C; Fri,  4 Oct 2024 23:58:12 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 4705761ADE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1728052092; bh=lBmtPz5SMR8x2RA0GWpTrsMS35fh9YMP6A5FFTzhFHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8LUwFjr0W7bpGoMxOk2syJv/L1WMsJPNDzwE0g2+6JCqVlGd6xQ+LWrvhTh9n0bQ
	 Jq1muAZB0hcu1TKPhLsYhX+BTcfzhEZFWdoYFCQJJxuAl2fzGgWRYzM60CMZauMqk2
	 dkLijsk0Xx+b7PRSNrW43h8oiCGWa6+sIXiv+3Bwtnb0WDCpz6NqmHWmchSE/2+V7w
	 kMF/oxCD00rPUzazBTWIZSKvdO/CZPelcQGnyglR612x/o+9Wpz4vY+2bAEqHNIaGQ
	 h1wdPjrsVW0v07G4PrwzzCVshVtO0siRrNEt+5mneypDhscc1SuADQGynCifMAXDIN
	 Poxh53REDTGrA==
Date: Fri, 4 Oct 2024 23:58:12 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 2/5] ALSA: scarlett2: Fix mixed declarations and code warning
Message-ID: <ede84092737fa2ca7e94371135cc1e42f1731e84.1727971672.git.g@b4.vu>
References: <cover.1727971672.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1727971672.git.g@b4.vu>

In scarlett2_compressor_ctl_put(), move the declaration of param to
the beginning of the function to avoid mixed declarations and code.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 003e91f9e43c..aa7c3d74ce8f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -5385,6 +5385,8 @@ static int scarlett2_compressor_ctl_put(
 	int index = elem->control;
 	int channel = index / SCARLETT2_COMPRESSOR_PARAM_COUNT;
 	int param_index = index % SCARLETT2_COMPRESSOR_PARAM_COUNT;
+	const struct compressor_param *param = &compressor_params[param_index];
+
 	int oval, val, err;
 	s32 scaled_val;
 
@@ -5406,8 +5408,6 @@ static int scarlett2_compressor_ctl_put(
 
 	private->compressor_values[index] = val;
 
-	const struct compressor_param *param = &compressor_params[param_index];
-
 	scaled_val = val << param->scale_bits;
 
 	/* Send change to the device */
-- 
2.45.0

