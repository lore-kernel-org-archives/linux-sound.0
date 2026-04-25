Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB341509AB
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 21:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777153189; cv=none; b=kPgcF8osJ0NrjwTxNKSjmCSipcnxU/NDpBlAzqdYVCD8D1EavuKmk4FLYnpPX+kEmm+8LW30JsLD/Y/ltLv3+P4OzZ9e9GcCSoKnrIAb4H0qJxlwgwMVA0VS4wOvHC7IxA9GADYeWUJq37L43R4jLRMdP+t2QnhIKq7hBi4+h0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777153189; c=relaxed/simple;
	bh=wTfQ5Q2z6D+mRlMV0YVWB7dRf3ES16ImvocStI30gwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HXT53gNBontY6xRhJNnlawhBjy4sYsMU2GVBFPnbxI2LkHc6vIzkvALQHqzSus8ibOAL4w2M/Fh9Hwu2R0RYWyhN/Vj2SIBaTN06TaA9aWhPKKGqfpbZLcrN/Sl1bawQdXS5vsOL5MdkTYGN/Zt/vZ2lAcmJatCqdsKNtVq9IZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=OAEi+LB+; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="OAEi+LB+"
Received: by m.b4.vu (Postfix, from userid 1000)
	id D747567BB596; Sun, 26 Apr 2026 07:09:45 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu D747567BB596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1777153185; bh=LgiDNsbguNaQxnuOZPjg1uYE4W/ea3v3lqQDzmhOKMc=;
	h=Date:From:To:Cc:Subject:From;
	b=OAEi+LB+o0PZDy3m+4jJDXgc176eKfrfhRe1XDsmFxbKCwdjtIPOxy7Izc8vnRO+I
	 ZTxYWaXHiw4nQa+Wl6pq+4BP44+2pl8kN1NAt/U+SGnElg7j6O5e7ZIAIv1s9hg5xy
	 Q/yF9RYAoHj9xdfJ8G6CMcZvzBOPKewa0YQHW2pw40liIfXowPX9kP+pqjZm7gI/q1
	 XrKScwmNNh9D2YP5mt5ybWn7Q8HzRCtfy+itm1niDBqjdGLhU1GUGTXtBRYCy3YHQn
	 fbz3mNnn8yXkyFYF97o9zNIGDUKVJomRM+z+RlWXdJm2K1ZzfRYxVoJEh2h1kQBY5M
	 MEJxOctBWfGdA==
Date: Sun, 26 Apr 2026 07:09:45 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 0/2] ALSA: scarlett2: Gen 4 firmware 2417 follow-up
Message-ID: <cover.1777153011.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

This is a small follow-up to the "Fix 2i2 Gen 4 direct monitor on
firmware 2417" series, exposing two features added by that firmware:
a new autogain exit code, and the front-panel brightness/sleep
controls.

Depends on the prior series for the config_sets[] machinery.

Tested on Scarlett 4th Gen Solo, 2i2, and 4i4 with firmware 2417.

Regards,
Geoffrey

Geoffrey D. Bennett (2):
  ALSA: scarlett2: Add Gen 4 firmware 2417 autogain status text
  ALSA: scarlett2: Add Gen 4 firmware 2417 front-panel controls

 sound/usb/mixer_scarlett2.c | 299 +++++++++++++++++++++++++++++++++++-
 1 file changed, 296 insertions(+), 3 deletions(-)

-- 
2.53.0

