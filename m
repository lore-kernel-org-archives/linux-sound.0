Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2791E98FB
	for <linux-sound@vger.kernel.org>; Sun,  8 Jun 2025 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749387441; cv=none; b=tTOSV0T79EEPo1T11HOYIpf+JlN2r1XTl7T8MKGreKSOaZ6kS5wGeneLXMc7CV0XAOyTEVtNJnM7zXImRBTTWrOHVIE42MvpTKbm5iQ50jHMVh4/Ogy85SpPxypYscatCyc4NOG70E2t65Kkyqk6sUbdd4hvRomu2OD0n1rKdTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749387441; c=relaxed/simple;
	bh=ZjNiY1y2u5kjTlkd8/fGf0g9nzDiVGj2fhehqICHAow=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=pB4W4lshpimSHPnUdBb3so1M+nMeDf5Oh88xpB+I6YCPigHVcXmvOTJlzAY8s586k1d1q+TB/Yd1cjhkV/Vv8XQo0ieAxkbVBQFDJgsIWE+yqSj0Gl2kP2rUIMm5lG9FYlQunDSWnlH6w7r84dd10hlWkqmNnPw82u1OTZNNzHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.2.111] (p5dc550b5.dip0.t-ipconnect.de [93.197.80.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 67E7261E64783
	for <linux-sound@vger.kernel.org>; Sun, 08 Jun 2025 14:57:14 +0200 (CEST)
Message-ID: <51fbfbce-cbc9-4e7f-9ce0-0653379ef9f1@molgen.mpg.de>
Date: Sun, 8 Jun 2025 14:57:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: C10 C-State possible when playing music on a laptop?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


On an Intel Kaby Lake Dell XPS 13 9360 with

     $ lspci -nn -s 00:1f.3
     00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD 
Audio [8086:9d71] (rev 21)

and

     Codec: Realtek ALC3246
     Address: 0
     AFG Function Id: 0x1 (unsol 1)
     Vendor Id: 0x10ec0256
     Subsystem Id: 0x1028075b
     Revision Id: 0x100002

Playing music, for example a song, the system does not enter the lowest 
C-State C10 (pc10)¹ according to PowerTOP. No having heard something 
about off-loading support, I wanted to ask, if on x86 laptops, the 
hardware would support C10 C-State when (just) audio is used. If yes, 
what would be needed on the software side?


Kind regards,

Paul


¹ In general it can only be entered after running the command below on 
that device.

     $ echo 8 | sudo tee /sys/kernel/debug/pmc_core/ltr_ignore && sudo 
powertop --auto-tune
