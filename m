Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E811CD29
	for <linux-sound@vger.kernel.org>; Tue, 16 Jul 2024 06:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721110193; cv=none; b=vAxynsHIj+QcdSnuiVJel1Ubxj2H13MelakKNukvwwESenJtTeDfV9twICaZ+dE7Fb31vcTsdS2e/IWHmo2Jnh//e6vwxPmjKlBthTTPaZ+6wCiK8bwxgex/irgEMmmNzwjEdjhEvJu0yvLq/k1iVBo2f71QQoiTUSL47rI0q3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721110193; c=relaxed/simple;
	bh=0081uX8nyqZFnB15j3PB4+vDTFHpVX2dXi671uQks+8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=RiE7sgpePreHyQ5joD31x/18oYvs99pn5u0zoYcELRW47+40w8Sqj0KBfLw5bwp54N75uIlx+yXpZRKZ23Q/CbeSAlaP8zO4I//XytqG5YOzx4RrtyBNqgRizzt+Cu7xGm3hV/1pnt1gC2QSCeslQBuIeWD/RuHHNUx1mN0hFhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (unknown [95.90.247.252])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id CC62261E5FE01;
	Tue, 16 Jul 2024 08:09:34 +0200 (CEST)
Message-ID: <e0465adc-12fe-40cd-9b2e-9e67b714e173@molgen.mpg.de>
Date: Tue, 16 Jul 2024 08:09:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: coreboot@coreboot.org, linux-sound@vger.kernel.org
Cc: Nicholas Sudsgaard <devel+coreboot@nsudsgaard.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [ANNOUNCE] Go utility *hda-decoder*
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear coreboot and Linux folks,


The utility *hda-decoder* written by Nicholas Sudsgaard was just 
submitted to the coreboot repository [1][2].

> util: Add hda-decoder
> 
> This tool helps take off the burden of manually decoding default
> configuration registers. Using decoded values can make code more
> self-documenting compared to shrouding it with magic numbers.
> 
> This is also written as a module which allows easy integration with
> other tools written in Go (e.g. autoport).


Kind regards,

Paul


[1]: https://review.coreboot.org/c/coreboot/+/80470
[2]: 
https://review.coreboot.org/plugins/gitiles/coreboot/+/b205f4e53ec30487ea1c219366e496664a3c20aa
