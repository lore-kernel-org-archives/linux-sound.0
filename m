Received: from iam.tj (yes.iam.tj [109.74.197.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DBB22096
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.74.197.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712841101; cv=none; b=cISvU+bH+8H2rbw/anRLmzQEuQhX5ebFnBZlN6HIZ33hfdDIM1KYQFHXm3j3f4EzuRf1FccfgYWMxxyDjsHWUqn/wZIJX/j6rLHFhS7RlLjc4D9DrwHZguLsdtYW0F/NfsAc3ZsLZ6kMb5qt3KfzHUxMi+MmQs1sZmXCMvrdSWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712841101; c=relaxed/simple;
	bh=e7HU2rvjsH5+mvvAMWiCJ2wZ2UqrpCl+hlZnmCgNOSE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=gKBYsQUkJUYoH5N6dilSiMu2RG8eHplKjz1X460Tmp1CHgEt0wRHGxAgsRAS+UdRc1J0fk8xwhFy912iHbdzkBKePsEpTw2EmgmxSOqh6Ak/RMnavaKnVvWq/xSkPHRwNIpdo3/Y6FvCD86JhGMLUWM6SkgZV7nWTWxW9zOe5Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iam.tj; spf=pass smtp.mailfrom=iam.tj; dkim=pass (2048-bit key) header.d=iam.tj header.i=@iam.tj header.b=K3GF7iD2; arc=none smtp.client-ip=109.74.197.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iam.tj
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iam.tj
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iam.tj header.i=@iam.tj header.b="K3GF7iD2"
Received: from [IPV6:2a0d:3344:11e:1ff0::ff] (unknown [IPv6:2a0d:3344:11e:1ff0::ff])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by iam.tj (Postfix) with ESMTPSA id 254EB347BC;
	Thu, 11 Apr 2024 14:11:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=iam.tj; s=2019;
	t=1712841092; bh=e7HU2rvjsH5+mvvAMWiCJ2wZ2UqrpCl+hlZnmCgNOSE=;
	h=Date:To:From:Subject:Cc:From;
	b=K3GF7iD2SkNMATxt1SqFTl1LUwF7kbeUOzbGwUWJoFTLX47c/H+NcAdKQdDEONbGl
	 WL0Kj8ZNwD7emPhWmbtY69576HQrYngdiYlVWyU+ECLnqq64nag9FcTyk3vaqD5EXG
	 lJbXw42AAhgeWX9seKHupvCfsi3vNMGfjT+vU7xNtohsrz6a74RrXwkpHaOpTuj8Yr
	 pfIJnYIkXVkVzVgJlmhZeHDCOlSfxoK+3gBE8j0wGpTEKJPBYLmSyhGskDp5miUY6C
	 WSNMYauw2VzzpWenr1m5xpyuYYm8q25VqLmeO4UXPj6DO5EkQW/l0l5VQcMD0x05bp
	 BiCmKjzfP9hjg==
Message-ID: <ecf0f3a0-b83d-4aea-9fcb-8c411598f833@iam.tj>
Date: Thu, 11 Apr 2024 14:11:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linux-sound@vger.kernel.org, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
From: Tj <linux@iam.tj>
Subject: Direct firmware load for TIAS2781RCA2.bin failed with error -2
Cc: Mateus Kaduk <mateusz.kaduk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

After fixing an EFI e820 MMIO mapping issue for a Lenovo Legion 9i in

https://bugzilla.kernel.org/show_bug.cgi?id=218444

we see the error:

tas2781-hda i2c-TIAS2781:00: Direct firmware load for TIAS2781RCA2.bin failed with error -2

This is due to the incorrect path being used to request the firmware; in linux-firmware the file is in:

/usr/lib/firmware/ti/tas2781/

but in

sound/soc/codecs/tas2781-comlib.c::tascodec_init()

it does:

scnprintf(tas_priv->rca_binaryname, 64, "%sRCA%d.bin",
tas_priv->dev_name, tas_priv->ndev);

Since no sub-directory is prepended here the kernel is looking for the file in:

/usr/lib/firmware/

We worked around it by adding a symbolic link:

ln -s ti/tas2781/TIAS2781RCA2.bin /usr/lib/firmware/TIAS2781RCA2.bin

There does not appear to be an easy fix for this since the function can be used by multiple devices with different paths; also there is no easy way to generate the path prefix from the device name. The most obvious fix is another field in struct tasdevice_priv to hold the path prefix.
