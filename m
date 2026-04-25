Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C3E1397
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 21:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777153202; cv=none; b=psV+dX2IJZ1dKHWnkmlU+rs76wwEsxwhkrnEB5qyM9qkgqIonPOqJzn/BlmT9r5HIV0Yr1i0iuxe/RJtHVt8qTpv4V8DKhXxX+ji2ZYilJvKV6idivDCpmk+42focrkiU73kM3nTAAr62oSbNBA5O8sNjW3dS/GaWaLF9k+oIFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777153202; c=relaxed/simple;
	bh=qgPoIE7KKLsJktVY0BOOK3V3uQzypq3bXKR72gtxLcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1jIBsvD5y8prpOpZZHd2NWcHpa62HW8oDqIz9NYYJNk4K1TdXwfXggXrxukFeBsbl39FKoZPpmWqpp+w8FTvQ5J286dJEzKsCdVESUDagcS8jvqCtame/A87kJx0W2Uep9JKtgKmF6Gts+9V8QOrhijclbp2VcFi46iaALOEJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=I/xNG2dV; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="I/xNG2dV"
Received: by m.b4.vu (Postfix, from userid 1000)
	id F19EB67BB596; Sun, 26 Apr 2026 07:09:58 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu F19EB67BB596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1777153198; bh=jRIFM/EIzRltTjPqd+X7VosNPJAq9gXHsezKtKs/om0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/xNG2dV2UOE/50HRvxsG1fPPV3ZfwoCegszjIMh7vbChJWNATWIa+gP6VuCkLrLM
	 dbkHeuETjvZv4isqEBoLLdOVkqNRQRTFAPhCxIR7qdsAPlKvLXsaoVed8ACewG5scv
	 MHegwqHlEC4TDMHeQR9jglNXqfzDxV3/io40Ynl9myFEiZC1q7p3r63bLufoir4pLG
	 nkLSLcVqXpLe6ypkQwR1hy9cRhgDbgSL8/n3Axud0tBRcVAbo8ELCl51jQuShWv+gB
	 cZ1c9+ifOKC8EMY3QF6ZJwVuDF4pubMhJAYuVg3IdfxTSOUavhqm4qbrgjLXrr1762
	 KHr4THbeBHB6w==
Date: Sun, 26 Apr 2026 07:09:58 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: scarlett2: Add Gen 4 firmware 2417 autogain status
 text
Message-ID: <c62bb12106d143fa71ceb3be4502221a34b35c18.1777153011.git.g@b4.vu>
References: <cover.1777153011.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777153011.git.g@b4.vu>

Firmware 2417 for the Scarlett 4th Gen 2i2 and 4i4 added a new
autogain exit code ("Root"). Without this entry the new status is
reported as "Invalid".

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index bb7373fac63a..002c93795238 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -398,6 +398,7 @@ static const char *const scarlett2_autogain_status_gen4[] = {
 	"FailMaxGainLimit",
 	"FailClipped",
 	"Cancelled",
+	"Root",
 	"Invalid",
 	NULL
 };
-- 
2.53.0

