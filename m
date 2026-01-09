Received: from mout.mail.com (mout.mail.com [74.208.4.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C66D13D539
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 00:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767918103; cv=none; b=HDrkryB6jh3eMBleY2mQUz1hfE3pUeUqA1yGUraOIRZm+ZMp+tpPXg/MVtxyvDcRqeCJjfacVKPJJVdaaO4xrynecjKhSxYCLG6d9AhqZ0f9VDRYCpVz4uRwZosaBUJRyKd2OU8V2dEfQq0udSW/ytpy8nJhrTmzMeiAuNF5evs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767918103; c=relaxed/simple;
	bh=iVOaoJwiDDBCFqxVeOsS6YEKNAKp/MM9+kYOjvavk6Y=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=edY68gdSKVrm9fkFxtZbY1xBEUzMSYKeypCU3VvYLz2iQzx0D5xdpKK9kCc9ORebuc9I2ZNDuHgpj1E5wpBEBJ/llHhrReL6IJkuGunFLXffhB/7wsd96lSRS6wHpu9sR69T7MhV7MY3Ai8e6PjdLTVTi9IxCSZUqlSAaVaOT+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.com; spf=pass smtp.mailfrom=mail.com; dkim=pass (2048-bit key) header.d=mail.com header.i=fenugrec@mail.com header.b=ODH5MLjU; arc=none smtp.client-ip=74.208.4.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.com header.i=fenugrec@mail.com header.b="ODH5MLjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.com;
	s=s1089575; t=1767918098; x=1768522898; i=fenugrec@mail.com;
	bh=iVOaoJwiDDBCFqxVeOsS6YEKNAKp/MM9+kYOjvavk6Y=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ODH5MLjUXXBiT1erFRugUWw3/TysLM1VLUawricsE3w3/nx8raCW9SFKzCHs2HWb
	 avh0jO+pxCGQgRwSK8ahcGrUbnnOmoedJkuDnEh/jNgbww7DeGNfyupOocTYOhuff
	 L/mnxUJk1mPU6xq/OZwl+SGXHr0du6UJ4+KozJPOb69gcyPxJ9rFpVCOSVOBkylGx
	 93lr3/KAbr8t1Vi166OJCxeZLclh6bbmpzsl9zvB1r8ogj1USAVwwAHUmr/YHNlp+
	 lCJ6g7ztxojadroKMpjh0by6NFAh97orvGke5B7pN51g8arQOcXYLw1I/loegJj9Z
	 sINLKL9RxUuY6ZzRMw==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [192.214.232.39] ([192.214.232.39]) by web-mail.mail.com
 (3c-app-mailcom-lxa07.server.lan [10.76.45.8]) (via HTTP); Fri, 9 Jan 2026
 01:21:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-46fb2e4e-993c-4225-b831-2d03dc541780-1767918098396@3c-app-mailcom-lxa07>
From: fenugrec@mail.com
To: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: accidental revert of Presonus 1824c quirk ?
Content-Type: text/plain; charset=UTF-8
Date: Fri, 9 Jan 2026 01:21:38 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <aWBE7DlmgZLoDkaI@ark>
References: <trinity-0d3414bb-7704-4eb9-b805-01baaa2fcb8d-1767805061344@3c-app-mailcom-lxa05>
 <87h5swh8m2.wl-tiwai@suse.de>
 <trinity-f8cff6e0-b542-4caf-bae7-2a84a9a58d59-1767886416445@3c-app-mailcom-lxa07>
 <aWBE7DlmgZLoDkaI@ark>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:0s7Wbf36p9316qP/O8f6+aQj8lNFpgb/efKPxTYtUgdHurhlmXENHGXQCQVd2RTFbSmMN
 S3cz8hEDSVYVGsvSeVCGTt0iYl5JHyto8DRZ2MphtYEvUmZ78QUsrVa86NuwMUE7peJ0NFQjGxO9
 NW7Fo3Q1nOggdksdPap3RwTWhPxrv/+Gv6ID3aFeNZ4i69wNQJsLnwgj/WdGZlkutXSV/WYqiE9v
 sSDH3PRqFMdH+T7hEfHu/Z4vKM0V+YgN/U0RL2FTSOIoZNsbBCfgYXgyXzIlEJvnDivsJI5ftOcR
 dk=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YG90LW9RmdQ=;pNjA7wr8scKHhIj/lVqGiBzQqXw
 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

Thanks Roy !

> same arecord test on arch with kernel version 6.18.3-arch1-1,
> 1824c firmware 3.11. And that recorded fine.

That is so strange ! At least we're running the exact same system & kernel so we can rule out a few things .

I wonder if pulseaudio/pw settings could have an impact on the hopping between altsettings ?
I'm not running pipewire, and in pulse's pavucontrol I had the presonus "profile" disabled.


Cheers,

