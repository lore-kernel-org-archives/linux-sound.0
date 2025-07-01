Received: from mail0.khirnov.net (red.khirnov.net [176.97.15.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D603279329
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.97.15.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381762; cv=none; b=Tww7tP34k5GbXXccgJj8KJWLyFyhJISDOaXE3vMOTvDRkQh6pN5+ii9m/jY+3eEO8Ynf+AN8KvyQpAaJc/nNsAsPAacfpzzLm4PRj/ZHm8IHDP9Drf9nEo7OG/YEDXrbyRUKv/FLUOjfmhlmeC8Jw38efOG3krhZE7VHstGAFgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381762; c=relaxed/simple;
	bh=vJYg8Tz/dPed3Drz+si/jaPjVxlMgITgKLW/J1rOAP8=;
	h=Content-Type:To:In-reply-to:Cc:Subject:From:Date:Message-ID:
	 MIME-Version; b=FPlXlDDVqvoGRfXY7sPd1kjwKIfHlJJ4k30kvFSLMka2jfOKO0t6SSw6S/dWtMKrHSs2eMSje5ylDrQ2rjnCcetpMKPVnLzyLixTk8dCoeMQZe21Khf8taqjJtrbJvL/QwJsmjL5uzS+G5oJTUoJ3nX8kA3qLe2U7qVtsZi4rZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=OGLasAtF; arc=none smtp.client-ip=176.97.15.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="OGLasAtF"
Authentication-Results: mail0.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=OGLasAtF;
	dkim-atps=neutral
Received: from localhost (localhost [IPv6:::1])
	by mail0.khirnov.net (Postfix) with ESMTP id 5D6AC24413F;
	Tue,  1 Jul 2025 16:50:23 +0200 (CEST)
Received: from mail0.khirnov.net ([IPv6:::1])
 by localhost (mail0.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id pVTure_6ZBL6; Tue,  1 Jul 2025 16:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1751381422; bh=vJYg8Tz/dPed3Drz+si/jaPjVxlMgITgKLW/J1rOAP8=;
	h=To:In-reply-to:Cc:Subject:From:Date:From;
	b=OGLasAtFz45waL3kO6fYfZ2IpeV4Z8VeuOPFhgCAQ8ozYuiLoqo19oKaRikwRymo4
	 MU3U0g40flxaRdiWh6ze2hw1Q99waLU7rIx2ifaQbk7/uWYvoXPoeMLl5sUJs0LkUp
	 7FN6rGuzEIud9GRcNU/S0LvREww6rXF53B5HlPlrmP71AIPezlInZR7o0qfm68yBWd
	 Y5ix8GaP829iXZ0LxOPo8c8vHhRGhsnksjFzcjb4c9TK8n3gCH+RVe6jKL58+fx1rq
	 vTBZ3CTk/QvbwQ4c6Zos7D6+ETWoz1Z+0qCmhtU26c6zduvKyzyk7W5FQTPNJ6qO+N
	 EgghXNVhYbSNA==
Received: from lain.khirnov.net (lain.khirnov.net [IPv6:2001:67c:1138:4306::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "lain.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail0.khirnov.net (Postfix) with ESMTPS id A3E9424413E;
	Tue,  1 Jul 2025 16:50:22 +0200 (CEST)
Received: by lain.khirnov.net (Postfix, from userid 1000)
	id 0AB031601BA; Tue,  1 Jul 2025 16:48:03 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To:  peter.ujfalusi@linux.intel.com
In-reply-to:  <20250701133411.25275-1-peter.ujfalusi@linux.intel.com>
Cc:  kailang@realtek.com,linux-sound@vger.kernel.org,perex@perex.cz,tiwai@suse.com
Subject:
  Re: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ExpertBook B9403CVAR
From:  Anton Khirnov <anton@khirnov.net>
Date: Tue, 01 Jul 2025 16:48:03 +0200
Message-ID: <175138128301.10212.11337556767252100138@lain.khirnov.net>
User-Agent: alot/0.8.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

+Tested-by: Anton Khirnov <anton@khirnov.net>

-- 
Anton Khirnov
