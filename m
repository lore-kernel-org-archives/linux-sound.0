Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5085A1DDA15
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728391063; cv=none; b=SOk23FfWx7dwB012xBivWPSkDuQuv+lczqM7REyTNswVkjef+wlAvippvxrLJ/YT/vhDOiiOkRpOH1ZkNjJq6MNZ1Up29I2ZJaXWqnT+QCVq75ZbM9CngdXQ/dlBZ2j9oKSDyiIWSxMwYwlqri0jZC6XksmwuHhSUfuOOjzchPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728391063; c=relaxed/simple;
	bh=QFh7IBQeHm4s7IvdYnHG3fF9KsefTOagdwQuTEJqaGM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=PrcxLh80lr0iaLJW6i6/8pyZU8NaVvLSkoQPO52I9MILK/OwZU5r1yNdoExN5yOKOr9McZqroxypxXZXAsOg3A38agflk9DxS08nt3DPMJNR4xFD0LwfiyyQ8eCXTrt6dSewUeFGAkvyBOKVvjsZM5EnYSLRvPbjYrdNqy0Uz1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [172.18.249.96] (ip-185-104-138-68.ptr.icomera.net [185.104.138.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6CCF26005B94B;
	Tue,  8 Oct 2024 14:37:15 +0200 (CEST)
Message-ID: <a302343f-e4a0-46d8-b67f-a834129c12c3@molgen.mpg.de>
Date: Tue, 8 Oct 2024 14:34:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Small distortion in `speaker-test -t sine` when changing the volume
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


On the Intel Kaby Lake laptop Dell XPS 13 9360/0596KF, BIOS 2.21.0 
06/02/2022, with Realtek ALC3246, while debugging a distortion with 
*mpv* 0.38.0-1+b1 and *pipewire* 1.2.5-1, I noticed, `speaker-test -t 
sine` works without crackling/distorting, but when changing the volume 
with the function keys or the slider in the GNOME Shell’s system menu 
[1] or the GNOME settings, there is a small distortion at each step.

I am currently using Debian sid/unstable with GNOME and PipeWire and 
Linux 6.12-rc1+ (upload of `/sbin/alsa-info` [2]).


Kind regards,

Paul


[1]: 
https://help.gnome.org/users/gnome-help/stable/shell-introduction.html.en#systemmenu
[2]: https://alsa-project.org/db/?f=fd6d250cc2e3bb36c407188a56932ffe36aec1c1
