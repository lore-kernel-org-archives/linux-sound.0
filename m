Received: from smtp153-183.sina.com.cn (smtp153-183.sina.com.cn [61.135.153.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686A63451B5
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 03:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792379975; cv=none; b=DhxcZ0o/cwg5+XeRtgPu3Jwg/CpgSUVpi9WjmRZTJ/apnBgT5cMUWuyutS+ZKhF6ysKfUUk3/8dJcFn7rGLYgoiXUEpoQmkkx2qdb+/nhbyvKQiwy9Iz7xoUUc/TXLi2tbUASoKlAa0gJ+RDmRIi2HJbRgy+ex+CYbk6HOQrdzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792379975; c=relaxed/simple;
	bh=zbW3Gugi4fbhIWl50G7yc8i43EF0zgwn8F4MdtheV5U=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=BP9zH5rydatDyB8mBn7iZ5Pqi8XmuJRX8WihOcRBg8e3v/qkIAtNPbMdZivqi62mSM8VQjcBfnzGgEppZ7cXIBK8KmQGLBo0vj4hBC+4Sz7uA45+ClUelcvcPLCKOgHZr8C+GOZKK4rPZkhw6aMJHhozA5cwq/xOGrT20+i0LNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO DESKTOPQJC4P40)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6AD589FB000045EC; Mon, 19 Oct 2026 11:09:49 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 1B6AFF5F6E2D46559DC35CF029CD861E
X-SMAIL-UIID: 1B6AFF5F6E2D46559DC35CF029CD861E-20261019-110949
From: <zhangyi@everest-semi.com>
To: <sammiee5311@gmail.com>
Cc: <zhuning0077@gmail.com>,
	"'Mark Brown'" <broonie@kernel.org>,
	<linux-sound@vger.kernel.org>
References: <CAJciObGfAwYw84mVU0knzJcdLkatWsccsijRBT3E9b25CKyF_w@mail.gmail.com>
In-Reply-To: <CAJciObGfAwYw84mVU0knzJcdLkatWsccsijRBT3E9b25CKyF_w@mail.gmail.com>
Subject: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D:_es8326=2C_es8375:_controls_tha?=
	=?UTF-8?Q?t_write_each_other's_bits?=
Date: Mon, 19 Oct 2026 11:09:47 +0800
Message-ID: <050201dd5f77$4d32e170$e798a450$@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLIocTf1gFs7D2VuU0mSpviONC3VrUtqVFA
Content-Language: zh-cn

Hi

	Thank you very much for pointing that out.
	es8326:The ALC Capture Recovery Level should indeed be applied to bits =
[2:0] of reg0x32, not reg0x33.

	es8375:The ES8375_DMIC_GAIN_MAX should be 0x03

	Thank you again for your email. If possible, please let me fix these =
two issues this week.

Thanks and Best Regards
-------------------------------------------------------------------------=
-------------
Everest Semiconductor Co., Ltd
=E5=BC=A0=E9=80=B8   =E5=BA=94=E7=94=A8=E5=B7=A5=E7=A8=8B=E5=B8=88 / =
Michael   FAE
18179079039=20
zhangyi@everest-semi.com
------------------------------------------------------------------
=E4=B8=8A=E6=B5=B7=E5=B8=82=E5=BE=90=E5=AE=B6=E6=B1=87=E4=B8=AD=E5=B1=B1=E8=
=A5=BF=E8=B7=AF2368=E5=8F=B7=E5=8D=8E=E9=BC=8E=E5=A4=A7=E5=8E=A630=E6=A5=BC=
C

-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: sammiee5311@gmail.com =
<sammiee5311@gmail.com>=20
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: =
2026=E5=B9=B410=E6=9C=8819=E6=97=A5 10:45
=E6=94=B6=E4=BB=B6=E4=BA=BA: zhangyi@everest-semi.com
=E6=8A=84=E9=80=81: zhuning0077@gmail.com; Mark Brown =
<broonie@kernel.org>; linux-sound@vger.kernel.org
=E4=B8=BB=E9=A2=98: es8326, es8375: controls that write each other's =
bits

Hi Zhang Yi,

I am adding a check to ASoC that warns when two controls write =
overlapping bits of one register. It warns on two Everest drivers, and I =
cannot tell from the driver which field is right.

es8326: ALC Capture Recovery Level and ALC Capture Target Level are both =
on ES8326_ALC_LEVEL (0x33), at bits 2:0 and 3:0. The DRC Recovery Level =
sits on its own ES8326_DRC_RECOVERY register. Should the ALC one be on =
ES8326_ALC_RECOVERY (0x32) the same way?

es8375: DMIC Volume has shift 2 and max 4, so it writes bits 4:2 of
ES8375_ADC1 (0x17). DMIC Polarity is bit 4 of the same register. Is the =
DMIC gain field only bits 3:2?

If you can confirm, I will send the fixes.

Best Regards,
HyeongJun

