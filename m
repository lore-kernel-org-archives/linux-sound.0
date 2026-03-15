Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BE9370D71
	for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 19:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773602457; cv=none; b=G28DQYQW81UM243XEgx9HZ3nSfIC+ZD0wk+wh94hCdiaYYP1Ai14A3m6x/zbNtupkfmzkDoB/3hFaLxNJiz4sPtxs17HAsX+15+/zStRJDKhj70JeioF5G8xwfqoUc+xngMZXmn650hxeE8qZA4PjvpaD7uonRiZ2ePA0estZXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773602457; c=relaxed/simple;
	bh=rhIGSwKT83Cl/XNUcJJs08nAB/Wwqkf/6gzmkZ7/nYk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhUxI0THcSR7gry/PDWkxHVQJfDhBiply0QnHKD6D6rJcNg8Tjd8q58M6baOyvR0hKy5bSixqJiU6AC3QTDNj2aiQExKuOJTlOV7Ja/nFBVXApqqmUvy3v3siFlLu914oJeXjo+xkDs9eSiwLS/7NN/AT5o33UcMDc0HMZJEWCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=Kodgwo2W; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="Kodgwo2W"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 7DCC9678F69B; Mon, 16 Mar 2026 05:50:54 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 7DCC9678F69B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1773602454; bh=b1+IuGASfgTeG2Vasg79LPchN022jJifT2o+Ek5X8fo=;
	h=Date:From:To:Subject:From;
	b=Kodgwo2WudhnbUYCt7L65r21mtn/aSLBa4chb4lSHVHMrrehtOUzoXujYG6+SkfQ8
	 QXTDmHcYt6MxCaR8S54hv/TtyX29USxkfNn3ZefAYTQ2Zr0MTEIJ5FQ4Mu9cjpxryt
	 ngY+9/gIDp4A3K5kTW3XMmWzG6KKsYLyJ7Lrw2vhdWN29c9QiYnBjubHt2WoiTDXvV
	 9ry4sFp30J1mSAMs504s9nfGUdTyuuqfEUiW6nre0WB/LLJH8VdEqXm0+CKE0cw5oy
	 XBqOL9EhAXFS5B3RSzsfV1RW7oOy7GB8GEA09yClcNOrrHoS0xhBOagb1vRPyl4y3P
	 Rl8Z/Ov4sA8xQ==
Date: Mon, 16 Mar 2026 05:50:54 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Subject: ALSA: usb-audio: SKIP_IFACE_SETUP regression on Focusrite Scarlett
 2i2 (1235:8006)
Message-ID: <abcGli7C40kr72mB@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

A user reported distorted/silent audio on 6.19.7 with a Focusrite 1st
Generation Scarlett 2i2 (1235:8006), caused by 38c322068a26 ("ALSA:
usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP").

The Feedback Format (from /proc stream0) changes from 16.16 to 17.15
when SKIP_IFACE_SETUP is enabled. The user confirmed that removing
SKIP_IFACE_SETUP fixes the issue.

This device doesn't have the internal mixer, Air, or Safe modes that
the quirk was designed to protect, so it doesn't benefit from the
skip.

I'm not sure if there's a better fix than explicitly listing all the
devices that I tested?

E.g. replace:

        VENDOR_FLG(0x1235, /* Focusrite Novation */
                   QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
                   QUIRK_FLAG_SKIP_IFACE_SETUP),

with ~23 of these:

        DEVICE_FLG(0x1235, 0x8203, /* Focusrite Scarlett 2nd Gen 6i6 */
                   QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
                   QUIRK_FLAG_SKIP_IFACE_SETUP),

What do you think?

Report: https://github.com/geoffreybennett/linux-fcp/issues/54

Thanks,
Geoffrey.
