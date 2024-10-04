Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65E825570
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728052515; cv=none; b=jAiGyF4Me7Xq4ZqFEgRoUvo2k2czNjgGSkckxcedIXDnWWso49Z/O4y4x045SsrFvPi/T8hW3jtmD28hy6Bnxwqgjqgw1f/mu/hPbf4m1WLlxzouRkQMR1IRtNbJhQJCKyUKP2s9qTHrkEQWfpZy0ITfVIRY8ZSayiAYGELz3Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728052515; c=relaxed/simple;
	bh=/8SzTOmvjWZQ96xzmvsnY43O9ZiwfnKplNCaHKMTuLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PjZpQS6mwgwb0jMwYyq6c8ZXtlxF6aFTst73bTdbAmvhYZePyQecuLkTLCh8a5GlmTGQEgVY26sZhlTtD9cqFRoGMsNpV7O2zTMrfOk9p9UDLTclA14nRV2CEIUWgqdxztRA9a8Y1b+dS+/rHl+yd0F/tbTgLG4pyqqqS0U0U3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=QMt3wxRP; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="QMt3wxRP"
Received: by m.b4.vu (Postfix, from userid 1000)
	id E0E5B61ADE59; Fri,  4 Oct 2024 23:57:22 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu E0E5B61ADE59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1728052042; bh=Dv60eNVZ/DnUsJJBx+3b5nYawN28aKhSW6nWL/e/RVM=;
	h=Date:From:To:Cc:Subject:From;
	b=QMt3wxRPk8Q2mdVlOYI3K3a6c6PBOx1/8mtA0P8vsZ//r773ktVH8O3p9HFE6B7J4
	 8DCqRxXIxrHdZojFMloxJW2jm5kLMhsnxLr3aAeDHAHKTqgfjI71wTZylrwtfNplRQ
	 OOX5MxIpBZmgpm8WU82RdBU4MP5DUpXsRdzGr8VCzilKLrDsOSRMTt/wh2hxEJUOqn
	 lMudI/IX73mnBZOS7l/kqJVRRebDpkwnddfhJCQkFHE4JkXUhQjCYHdTIQ5xALahWg
	 vPNHypkyfWS0FerLgpqFH1tVwzleY/i89A6dEY9AKT6Z0IlDfEwE3YIKs7AgXG4MZe
	 I76WP2g21XCHw==
Date: Fri, 4 Oct 2024 23:57:22 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 0/5] ALSA: scarlett2: Small fixes + device map retrieval
Message-ID: <cover.1727971672.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

This patch series contains:

- 3 small fixes, I don't think need to be backported.

- Simplification of linked channel handling to match how the firmware
  works. This is needed to be able to handle the recently-announced
  big 4th Gen models correctly.

- Addition of support for device map retrieval: the Vocaster and
  Scarlett 4th Gen series added a new operation allowing the host to
  retrieve a base64-encoded zlib-compressed JSON representation of the
  device and the location of each control. This patch makes that
  available through /proc/asound/cardX/device-map.json.zz.b64

Regards,
Geoffrey.

Geoffrey D. Bennett (5):
  ALSA: scarlett2: Fix redeclaration of loop variable
  ALSA: scarlett2: Fix mixed declarations and code warning
  ALSA: scarlett2: Return ENOSPC for out-of-bounds flash writes
  ALSA: scarlett2: Simplify linked channel handling
  ALSA: scarlett2: Add support for device map retrieval

 sound/usb/mixer_scarlett2.c | 220 +++++++++++++++++++++++++++---------
 1 file changed, 165 insertions(+), 55 deletions(-)

-- 
2.45.0

