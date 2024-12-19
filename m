Received: from out198-6.us.a.mail.aliyun.com (out198-6.us.a.mail.aliyun.com [47.90.198.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED9F2165E4;
	Thu, 19 Dec 2024 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734598482; cv=none; b=S/dfOoorjUisx9pX1Ge15iE8IsVzhYhSGtc9tfXfq6xYlon6oyOLsN4++HPNbQ+O28ufSuxf+F7gy/eiEuRpYgNBJLzLNdBod5EBfmq9yZ8cIIXxf/0gqB5ZOru9UTR4xxtVjbC2TMUktZtYxMdr/rgBimy6yBMBRYCMuyrWkxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734598482; c=relaxed/simple;
	bh=Ry8XHStwFxaDCx7QO7vwl7arMBGAFLJ1G5ZBLklbqZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6AJlEl6Nyi19ptK0jbqFa5e7hC1gITF/fkmOB9/XjavQwa9npN+8G5UcaQ9jc9LIRDcaa1klZNbk51dZYGUh9iogukyAjCA4pJxq6VRLC/rXSEi6pay0zEgqIJl3sw4qa4QZwozhw40xyrB/w6r6WD7iPDbQiVSCULuKABz5M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=47.90.198.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.ahuruZy_1734598449 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 19 Dec 2024 16:54:16 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	herve.codina@bootlin.com,
	ivprusov@salutedevices.com,
	jack.yu@realtek.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	masahiroy@kernel.org,
	neil.armstrong@linaro.org,
	nuno.sa@analog.com,
	perex@perex.cz,
	quic_pkumpatl@quicinc.com,
	rf@opensource.cirrus.com,
	robh@kernel.org,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	yesanishhere@gmail.com,
	yijiangtao@awinic.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH V1 2/2] ASoC: codecs: Add aw88083 amplifier driver
Date: Thu, 19 Dec 2024 16:54:09 +0800
Message-ID: <20241219085409.29073-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <152595a2-2216-4c6c-935d-9c58939bffe0@sirena.org.uk>
References: <152595a2-2216-4c6c-935d-9c58939bffe0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Dec 10, 2024 at 12:51:13 +0000, broonie@kernel.org wrote:
> On Tue, Dec 10, 2024 at 05:10:54PM +0800, wangweidong.a@awinic.com wrote:

>> -	aw88081_dev_clear_int_status(aw_dev);
>> +	if (aw88081->devtype == AW88081)
>> +		/* clear inturrupt */
>> +		aw88081_dev_clear_int_status(aw_dev);
>> +

> These if (devtype) statements will get hard to maintain as more device
> types are added (and the diff here is already pretty confusing).  It's
> better to use a switch statement with cases for the devices that need
> specific handling, that way more devices can easily slot in.

Thank you very much for your reviewer.
I will use "switch" to differentiate devices


Best regards
Weidong Wang
