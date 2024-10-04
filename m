Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F02C69D2B
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728052124; cv=none; b=IJ9xogbwmhGw60fjFQ4Y9J+Lzb7LnybRtn7BNrmXRBwU3eY+oL5RpsDsJKl7usE+aIe+V2qGxd6cUgfv4YNrRgdOUqZKNoq9RAIQPSKbv7KjHT5S5nasLQXXtt9+hKLFz3TSsmiR1bml2xPj6oJ3bqQxnTpdzd3VquJxQua9HMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728052124; c=relaxed/simple;
	bh=Qx9ibklWoTECgN1ANUuhsfNxPq4iFE0t1KDs/4wy7Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXIBa9Ft2ZqQhn2mwPBKUbaCXBBgW0rZ6MUm5naWLkTjqOMhBH5/pej0ryF919ekW7KbnCM4Ulx4vtPKKsQ45Q22H0UEDbM2Fs9W2Zx5u5rwu0nSupXQ4CIwW8XlYJaIOMtHtKQCmagZToza7gdi6QXgsMStMgelvuWSuMkU5Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=oPDplXuy; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="oPDplXuy"
Received: by m.b4.vu (Postfix, from userid 1000)
	id E7B8C61AD441; Fri,  4 Oct 2024 23:58:39 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu E7B8C61AD441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1728052119; bh=xJDS0SyZZ/t5jVZvFG0e4monFG4FgwHosF8FQgv2zsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPDplXuyQ+uypNTTgzvla5Dwkr+i5pYNHrDt/mA1OSP01f+dBALS9LPpVfZHwMNU0
	 D3oQfD5MH8LW31qvEgH8l1GRywnmuEpZ5HAoPSyCHuuhNtVnC1E7x/Hxd7+pQpT/eC
	 etRPYxy9iiqG8Wscz1Ncserdw3tvmbfo4JgBe79rzaJgE2OltudlgfHbN9HfVhjLY7
	 YqRkCWdtpz+n6Ff5B3GdwlMQ+M3IEy5cfTdA4Y0o/l+X+CoSFh/R41XjdTIurCHNIi
	 d66UySGaXnUyyAO4tLn8xSAqWEF6fAR/GWv58rPwnSwKXGQZVgl1FzQpPCJIdQxsj0
	 sLo8w4HtvygGQ==
Date: Fri, 4 Oct 2024 23:58:39 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 3/5] ALSA: scarlett2: Return ENOSPC for out-of-bounds flash
 writes
Message-ID: <3a4af07b0329bed5ffb6994594e4f7bd202aad0f.1727971672.git.g@b4.vu>
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

When writing to flash, return ENOSPC instead of EINVAL if the requested
write would exceed the size of the flash segment.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index aa7c3d74ce8f..844e95cc965e 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -9516,7 +9516,7 @@ static long scarlett2_hwdep_write(struct snd_hwdep *hw,
 		     SCARLETT2_FLASH_BLOCK_SIZE;
 
 	if (count < 0 || *offset < 0 || *offset + count >= flash_size)
-		return -EINVAL;
+		return -ENOSPC;
 
 	if (!count)
 		return 0;
-- 
2.45.0

