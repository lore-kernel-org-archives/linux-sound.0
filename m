Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66561E1A3D;
	Thu,  4 Dec 2025 01:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764812866; cv=none; b=qKz5zcWhWghUN+P5Fh8dpWpFTr/Ozrr3mbR54rY8mbd7+GPeDIqk96l43Xi/Vj/rwea3hxXJUbXtkZD7a0274QVgYZ8NzhkjtRxMZ9qriB+UJ34PEms57IRKDtPbVF/QPHflyEemfVGc4seBXm25sz7BU4/21IAjoyEttGaC5PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764812866; c=relaxed/simple;
	bh=+xYAcQOKBf8uiltUFYoCyhfbqxS8uiLHm951K1e+HpE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=mhkK0+mgA6W2/1TmteNqfIY7OS9bHOIp7q5EyGP0NGtndDKl7CzM6/wZOc2zweq5cMozRdDYXraG2kE0+QH3RyESfS1zp8CjiPc/Zy5rYt3EpiE7BrG/PKgUk8bOt9m+PYE82anevYrLUl26U6dyXCStcJRdVbWav6oBvNRHPFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tvU46CL1; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tvU46CL1"
Message-ID: <0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764812858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cqBwRVgMvJ4drz12eF6dV+Ug2+kayVyLtT7P5pOcAxA=;
	b=tvU46CL1+k4A/iJdJw3mBcxIE1vscbikwpK/WEWXdWVrpHn9PZmnHnjCQnKNRoIZ12dLN5
	202EFV3a1GR7XFK2TCU0VBobERkhZoRPoZ4OVWS8ow73vh2TGSk+h6dMaEHJQN9OMU+n4a
	CeHddSnkp55i2wspq4IkEhPweKDnG7k=
Date: Wed, 3 Dec 2025 17:47:33 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: Baojun Xu <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Cc: linux-sound@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Antheas Kapenekakis <lkml@antheas.dev>, tiwai@suse.de
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [BUG] hda/tas2781: ASUS ROG Xbox Ally X audio issues with default
 firmware
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hello,

I have an ASUS ROG Xbox Ally X which uses hda/tas2781 for the speaker amplifiers. I am splitting this out into a new thread based on the suggestion from [1] to fix the remaining issues with the device's audio separately. 

I built a kernel from tags/sound-6.19-rc1 in tiwai/sound and included [2], which seemed potentially relevant to the issue that I describe below.

By default, my system loads /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13840.bin.zst. With this firmware file, any sound above the 70% volume limit range starts to become distorted and frequently drop out from either one or both speakers. I've included an alsa-info.sh report with this default firmware at [3].

If I run sudo mv /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13841.bin.zst /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13840.bin.zst and force the other firmware file for Xbox Ally models, my speakers work up to 100% without any of the drop outs I experience on the default firmware. I've included an alsa-info.sh report with this renamed firmware at [4].

I took an acpidump at [5] and extracted the dsdt table at [6]. Please let me know if there's any additional information I can provide from the device to further debug the sound issues with the default selected firmware.

Thanks,
Matt

[1]: https://lore.kernel.org/linux-sound/87zf8jesp0.wl-tiwai@suse.de/
[2]: https://lore.kernel.org/all/20251126141434.11110-1-baojun.xu@ti.com/
[3]: https://alsa-project.org/db/?f=840337cab11f6aa70cf48b15d55ac45e4027ff41
[4]: https://alsa-project.org/db/?f=6e482f72765d89520ea171f15641228bcadefcf0
[5]: https://gist.githubusercontent.com/matte-schwartz/d7ff3c857b45cca197f3d3adc16df0bc/raw/2e3267b8d1a9d619ecd8157e4da426be756b6497/acpidump.txt
[6]: https://gist.githubusercontent.com/matte-schwartz/4042dcd3779c3738af60536a9d4050d6/raw/5227717c6d40a2dc4012b95f7fefc6cd50ba784d/dsdt.dsl
