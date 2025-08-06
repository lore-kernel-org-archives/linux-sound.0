Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4163F21CA02
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754468130; cv=none; b=MRqaIey42F0TiaWfrjAoPtBjT2g5jP9+b5SZ0Ylgw/EFi40ECwEypaZ70nS2Wxm2797p8ndjuG11QTO+WGI2QubSnJxQxpGRwZIVYOHkE+z+EzLLNq7iNA0EAkh1U9ajMZ+O+proro6/RG73H3amMZV2cGQz94lcBCmX0h+JtgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754468130; c=relaxed/simple;
	bh=IVUCScq+wgERBDN1As1mbw1tOvrOYQlA9OvBxMzkBvE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=c2l+RSjsrHhxLougMenblTDOgjjnOy6GXeMG0I1KzYM+BpRKOYbgiSDv+6Q7sDe0kWcAJBdhlo4q/oW3ZJI+m9eZDzKkSNHtrU4W7IReaP/K4pmDSGfOSlJU1793Biq1TARHT+jbFROudeyrT+3cPPa6K8Z4FuX+kP5pc/b2WPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.192] (ip5f5af7ca.dynamic.kabel-deutschland.de [95.90.247.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 76E2261EA1BEA;
	Wed, 06 Aug 2025 10:15:09 +0200 (CEST)
Message-ID: <10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de>
Date: Wed, 6 Aug 2025 10:15:08 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Quiet crackling noise at boot and after stopping music
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


I believe the Realtek refactoring caused a regression on my Intel Kaby 
Lake laptop Dell XPS 13 9360. There is quiet crackling noise during 
boot, when GDM is started, and also after playing music is stopped. It’s 
reproducible with 6.16.0-04055-g14bed9bc81ba, that contains the sound 
subsystem pull request.

177bf8620cf4 Merge tag 'sound-6.17-rc1' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound

I uploaded the run of alsa-info [1]. I try to verify with plain 6.16 later.


Kind regards,

Paul


[1]: https://alsa-project.org/db/?f=6d2c66f2374b4ee6eb406a1d2cce60d1f17bed33
