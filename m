Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864EB13A24A;
	Tue, 24 Sep 2024 19:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727206212; cv=none; b=KcfZFlK/N7Nn08LYLYa6fqQ5M4XhV/CJsmwoS5E3kVEvzrjYtaWq3wVw/UFJ2MQHkbqeUy3Jfc4Pvyc6yTvjGcY7Z0XvhSDCFkm0Hpc3qFe4I29KujcHtplH2e0F0LJmvV93wTwQPs0JXqTnPTSZHQ0wYy/U7FMp5LmtFf8UVnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727206212; c=relaxed/simple;
	bh=+wopT08PO3Xk0qA3KFxOOUdPV3pkqooiSc1oP6uVNfs=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:Subject; b=giWru8xgnFN0g3kOUe72VEnkpCNrXHAjaVCyP5GxcspbKupKIenTKjb/ZsAIKQHNAZqcSradE23UGKRxnk65qqqy9RL20XHlq/PdqSrwW41/uJmZPUoUT1vC3adaoiaeL414NiFngZiXVmw3nOuOuCjfhXSjm5JMVMhQbxrpjMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbQ/P9F2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbQ/P9F2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E92AC4CEC4;
	Tue, 24 Sep 2024 19:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727206212;
	bh=+wopT08PO3Xk0qA3KFxOOUdPV3pkqooiSc1oP6uVNfs=;
	h=From:Date:To:Subject:From;
	b=EbQ/P9F26//q/tqOHfq4RdU8fHdx1ZJVdQ4UJmpppyRqzR5z38iOsqXaErmPP4uvr
	 dGlx40q8I2FD3FJNGizwRCooGy1tW9c7QZe7uZSm40ai7ivB8yF8BEEexugkXVqU2o
	 DEerZNipJQ5/tu9twTqbZerZbNQ+lPhTe3++7V6roNNWQHoPQD5rcrjjRwEF/WRB/O
	 R67+N0wwe7rMpv4mTaj968IT/3ldINulElxe5v7ao59CjN3M22l7AEFbyiADSMLKDd
	 KpCirtSmUmXNgZomDChvPXFAvcuiVJlOB88BkWNq9/buXJ+ZMS+09e89D1FM8fUa/h
	 oa/GV2e8yx2MQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 781F63806656;
	Tue, 24 Sep 2024 19:30:15 +0000 (UTC)
From: gfrank227 via Bugspray Bot <bugbot@kernel.org>
Date: Tue, 24 Sep 2024 19:30:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org, 
 bugs@lists.linux.dev
Message-ID: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
Subject: Mute LED light is not working on my HP laptop
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

gfrank227 writes via Kernel.org Bugzilla:

I have a laptop, HP Pavilion Gaming Laptop 15z-ec0. the laptop has a mute LED light on the F6 key. It is supposed to light up when the sound is muted.  However, this does not light up when muted. I have tried various models under snd_hda_intel but nothing has worked.

The sound card info is:

/proc/asound/card0/codec#0:Codec: Nvidia GPU 94 HDMI/DP
/proc/asound/card1/codec#0:Codec: Realtek ALC285

The research I've done indicates that:

 sudo hda-verb /dev/snd/hwC1D0 0x20 0x500 0x0B && sudo hda-verb /dev/snd/hwC1D0 0x20 0x400 0x7778

enables this LED and

sudo hda-verb /dev/snd/hwC1D0 0x20 0x500 0x0B && sudo hda-verb /dev/snd/hwC1D0 0x20 0x400 0x7774

disables the LED.

This bug is similar to this bug: https://bugzilla.kernel.org/show_bug.cgi?id=214735

I believe there may be a patch already for other HP models, but something needs to be put into the kernel to tell them to trigger this patch.

I would greatly appreciate it if you would be able to apply the patch to my model so that my LED light would work properly. Thanks!

View: https://bugzilla.kernel.org/show_bug.cgi?id=219303#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

