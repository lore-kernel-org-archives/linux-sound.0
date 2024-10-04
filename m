Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68951D5AB8
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 14:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728052080; cv=none; b=M5I6+ZmF+Qvw5G6qmPp2hdyQDUWcIAMB3ksD/Vk41JTvQOyd8iCIB4RVpr8BfQ/V0iKpTTnYLq3Yn7Rod51Lc5N+32FL/JOrrJqSU7zncG+oTPVzhSTuSS8TQqPZNxl9Xp9h5eNkwXkcsX8/MXT16cHvXcpapu0MaQhqgmqxjcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728052080; c=relaxed/simple;
	bh=1XiSumeCOguOZ7wbwoGRQuDU1RrpuDMZu/3tHzq4LOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myoff9EU6O+Ct6SWQAwqOn2YTXc2ZZbdq8FV1l4ZgfdmXHhcLwmwdg1s6j/Xf/yoSl+OVzRTLxeMw/Pm6W1nbd3qrOeUyoHNvYUEDvxAUkUWANFK9ZVcF/VuNdUrph/0nKEO/j8/Du8hbRhUCJLCLtBab55FaNDtUXoc0yAow7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=WWXrM9yp; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="WWXrM9yp"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 5738461ADE7B; Fri,  4 Oct 2024 23:57:54 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 5738461ADE7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1728052074; bh=gWqIkaot0segzTgelNwgDzKzxMXvz5CqB8jjGYKQR1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWXrM9yp8w1T7F+hupj8ibWzcnp9ciUu57JjzlU10a1ZbEtle+adICjt03nbkDoEU
	 Lx36e1ZSLbgWnVyhVLnpXe4lbCguwFowEdCLcUauj+C54zGB7XT4qCjpGMYNESa3Av
	 ireSJZTlyAclNELGEzLqzecsOwz+LXx2f/4IdtlayDbb8jPdpvsS/n6oSb6OEFfvnu
	 q9l+twSnvH0aF8fD9Z2PF62F5HX0vO6tqmkG45aP34mSrKHRi19THnRD3RYP/+6MzG
	 BucO6bwiE1+0VL3nmonw0vr3/7XrbPjbIUKr4tzpMCQTGOiiF3CXkF/PCHYNFJ4Tzq
	 0GXXC4csBnkNA==
Date: Fri, 4 Oct 2024 23:57:54 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 1/5] ALSA: scarlett2: Fix redeclaration of loop variable
Message-ID: <ecb0a8931c1883abd6c0e335c63961653bef85f0.1727971672.git.g@b4.vu>
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

Was using both "for (i = 0, ..." and "for (int i = 0, ..." in
scarlett2_update_autogain(). Remove "int" to fix.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 1150cf104985..003e91f9e43c 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -3409,7 +3409,7 @@ static int scarlett2_update_autogain(struct usb_mixer_interface *mixer)
 				private->num_autogain_status_texts - 1;
 
 
-	for (int i = 0; i < SCARLETT2_AG_TARGET_COUNT; i++)
+	for (i = 0; i < SCARLETT2_AG_TARGET_COUNT; i++)
 		if (scarlett2_has_config_item(private,
 					      scarlett2_ag_target_configs[i])) {
 			err = scarlett2_usb_get_config(
@@ -3420,7 +3420,7 @@ static int scarlett2_update_autogain(struct usb_mixer_interface *mixer)
 		}
 
 	/* convert from negative dBFS as used by the device */
-	for (int i = 0; i < SCARLETT2_AG_TARGET_COUNT; i++)
+	for (i = 0; i < SCARLETT2_AG_TARGET_COUNT; i++)
 		private->ag_targets[i] = -ag_target_values[i];
 
 	return 0;
-- 
2.45.0

