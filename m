Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D217C16FF59
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268534; cv=none; b=c9byhDIc6u90rz7vyvnUcsk6BOfRyvAuOLsdKOTSn2m3DUhPOa/vK7suGjnP5IjZLa0mOwy5sVrHXWpIjPzaZcf0bvhiR0qaj2b6It46fUe3VNb7SnjEGPmdI7vKtPhYXS5kB29Nt9lc1qBNpRKO2UOEWs7QiEKib5vTe0BCoZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268534; c=relaxed/simple;
	bh=qamp655kzu1RbiF8tK0bonzwXVK36TvLV1BthDomM6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVgTHOzkuuIYmsMHuH6Q3GPzPU0pe1XeoHaiunsi56gViJ6mT0x6nzy/7c6BvFEJ9T8gzCwSHT+neom5RWRXlB/tX6njicQ7ySHO7iBw3ypsQ8zpQR7RJonFqMdUTP08ShGBN3Fjuy/YPv7rD6FqhMtIw07Qk4i9re6KeZndVdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=F5tjVAKa; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="F5tjVAKa"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 016BD604B628; Wed, 13 Mar 2024 05:05:31 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 016BD604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268531; bh=KAXIvFY7iPPCD82xX5+mrYk3b0cBShNJqDwZVsF3vjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5tjVAKanmhQ8gji/XjDI9boIAzhISbXlgbsZQwrjXWwSWmbiSl5HzPXnMdMll5mb
	 z/XGVwFz5c221ypb/tM4wl3D2fyDFsG3Li9fDYvawzC/7nOhbEJuXmzdYyX65wzp6Z
	 bzy6KuLMEp45dvAX3mGKnj1LLGVTyeK+rKg/0cnkGOblXtT6/2fbyiCSgPKPigNGMt
	 KfzW7zYZMDEcrzHOgHiH3VWa127h8YwVNkMFYQ12HWPmv6YOnQRcr6blhUuzYugxjk
	 8ozXuVBqnYChUsJOKo+Xx9/MoJNbeDaUfOeiNVaawx+oTUITdCiTxiXcQKnN/qQcyC
	 RjjVv9+Rxv/tg==
Date: Wed, 13 Mar 2024 05:05:30 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 06/14] ALSA: scarlett2: Add support for config items with
 size = 32
Message-ID: <ee35dce0172b2aa3fec8163ab8f35bdc35a141bd.1710264833.git.g@b4.vu>
References: <cover.1710264833.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710264833.git.g@b4.vu>

Update scarlett2_usb_get_config() to support 32-bit values which are
needed by the upcoming Vocaster support.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 8d08f71bd4d6..f2bbf90680f8 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -436,7 +436,7 @@ enum {
 };
 
 /* Location, size, and activation command number for the configuration
- * parameters. Size is in bits and may be 1, 8, or 16.
+ * parameters. Size is in bits and may be 1, 8, 16, or 32.
  *
  * Vocaster and 4th Gen devices have a parameter buffer to set certain
  * configuration parameters. When pbuf is set, rather than writing to
@@ -2102,6 +2102,11 @@ static int scarlett2_usb_get_config(
 
 			for (i = 0; i < count; i++, buf_16++)
 				*buf_16 = le16_to_cpu(*(__le16 *)buf_16);
+		} else if (size == 4) {
+			u32 *buf_32 = buf;
+
+			for (i = 0; i < count; i++, buf_32++)
+				*buf_32 = le32_to_cpu(*(__le32 *)buf_32);
 		}
 		return 0;
 	}
-- 
2.43.0

