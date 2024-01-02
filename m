Received: from mail-200167.simplelogin.co (mail-200167.simplelogin.co [176.119.200.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8881773F
	for <linux-sound@vger.kernel.org>; Tue,  2 Jan 2024 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=willian.wang
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=willian.wang
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=willian.wang header.i=@willian.wang header.b="hDZ6dqAk"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1704236204;
	cv=none; b=Ax8fTMPZBMO2aleNAKrdI6n5Q5T9gbpiSjZNu42Tv4zKT6G6Gb6bRq2R3AI/x55+bZRk2/sAhAxWbGdQVJ63k09EF1D6vCDdrPGdyEjiXH7ninh3oQPCyv9g88qjsCwwoLxGvhwpXtsKQvEC781e9jtDme0O4OaS7aHzXF/9CyJnrBqfoGnqRYRrT0lW7Dupyh5OhZTjotx8e6wOzXwqXXoPyFIfGmHEtPW47+p4lJJxawSNY4rIK+MDu3DJ+51YGUQvzTmW4o0y6dlKb4xtj3VLX6HVKapJGw/nMqFISUhEest18g9eOhaLfjRjRHEH8b5DhSYBJ7DiPblYC87VAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1704236204; c=relaxed/simple;
	bh=kWAKk3nloB2r8KYY+fac/aEI7U47DszvlPld13tJ92g=;
	h=DKIM-Signature:MIME-Version:Date:Subject:Content-Type:
	 Content-Transfer-Encoding:From:To:Cc:Message-ID:X-SimpleLogin-Type:
	 X-SimpleLogin-EmailLog-ID:X-SimpleLogin-Want-Signing; b=Emvct8kDiyW33WAhsQSjxeCF4ZtxYW/7Q/M1mzslXRhHv12g8fo7j4i/scv2haiV/pJyshivcjnq8JSyGSpHLpLhsmWYbGIRCIf5jzLq0bSMymQw3hwlXbJGecL5LBuM2b1fkxFf/31ogDv0aQ1anIQcugPIceNJ8SL/rzAddTmnC3fc6FmvOTy/RKNp9tWkh615RElMW7PnBHDFPnB1w/alYBu4KX6JbnQFz3NPom7wsCU0kmOBUkh0GdhUJ79sRKIyrGWwQWQGxFssfUDFiZ1SNXsIAdsfoMm03li+TrtommTebdfbt5oUhqZ1yszhymQmzGhZDtsvafafgNnD4w==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=willian.wang;
	s=dkim; t=1704236204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kWAKk3nloB2r8KYY+fac/aEI7U47DszvlPld13tJ92g=;
	b=hDZ6dqAkxJrIRdTQHVYPkGWrlfTSbj0zhH9W05oJHKmpOW4YEhOBm6d8HpNEUMOgcPXTjc
	RdmQ2YAI9kFA4pdohowWN+V+LbxnHJYzexEcq95AJkXdtv+rj1qlcPyGtK5BT1As3k4Grh
	uKDPcGdeia3V2W9ELwg6SbspVvqbgRI=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 2 Jan 2024 19:56:03 -0300
Subject: Re: Oops in hdac_hda_dev_probe (6.7-rc7)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
From: Willian Wang <kernel@willian.wang>
To: peter.ujfalusi@linux.intel.com
Cc: 
 tiwai@suse.com,regressions@lists.linux.dev,tiwai@suse.de,ranjani.sridharan@linux.intel.com,pierre-louis.bossart@linux.intel.com,perex@perex.cz,linux-sound@vger.kernel.org,linux-kernel@vger.kernel.org,kai.vehmanen@linux.intel.com,lgirdwood@gmail.com,broonie@kernel.org,alsa-devel@alsa-project.org,linux@dominikbrodowski.net
Message-ID: <170423620368.7.11626876748388238508.241693435@willian.wang>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 241693436
X-SimpleLogin-Want-Signing: yes

Hi, just tested the patch and both sound and resume-from-suspend are
working like 6.6 again =F0=9F=91=8D

