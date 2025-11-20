Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57D9372AC5
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629338; cv=none; b=tBSQdwKOLb6LJXBRGQSYQhxG2P0z7Z8ja9n1FEt4nxZ4dChSq1gRlmDkKN6NhXFDJswwj/Dcqs2akoXzVHyJJ0bxOxBHTbJYj7oIOaDFf4MUxj1Csk88mJ7Xc44Uhzbh2+2r4AiRW5+qJKPVTUvh6tod0hhT+TpKjBETypXIYw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629338; c=relaxed/simple;
	bh=FvsqzrFLDZGiZGqyhTXpJPn4/vLD/xOXQippaexB3pc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CK6G2Xcyogw6vmof1SJhmW8iJQ5XXPIALLx+CjNhSCfHJ+F4L7aDjE4/qz2GZyf18AZ1QTt+6h59hxviIKW4XzLqPEX9TmzpqP7Oz7Wt9qGFYwjpmNnhXR1jN901zylSarQ6Hj7SG22SYfLfE+MnOOJClglk0M3pNc5DRbtkN1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Xd1XGU3U; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Xd1XGU3U"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AK91sxoE1198788, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763629314; bh=FvsqzrFLDZGiZGqyhTXpJPn4/vLD/xOXQippaexB3pc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Xd1XGU3U3J+fW+ZhyiHtKgTN6/PLbbycN1BSew0WRsJpyiTW4DACauV2V2VIDrbT6
	 weV2GOi1bzaYRJPGPSe+nnH7qOlpXPLj2hwK4IpQ8JxZjwjpJNYWHhp18Mn1Dbhlxy
	 JSAp2O2Hfd0N9tQWXDJBGuhC74mXh4kE2I074igIKFLHkUOHEvgOFdSBdJNAuUM3k2
	 kwgupB3FRhext1bMyVpsrtj6awD/toDD+MBymNZmRUND0pSI+2ltAeUwhgdnRFReBE
	 YFse8Cw6LEOng1Pjt+pchCL0ayUI4PjV5LcnaDrzz4O/RCn4/0E4V2zA7CThyFcIjG
	 zQVXtrFjUzbhg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AK91sxoE1198788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Nov 2025 17:01:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 20 Nov 2025 17:01:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::744:4bc9:832c:9b7e%10]) with mapi id
 15.02.1544.027; Thu, 20 Nov 2025 17:01:55 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: Support Tas2781 and mute led for HP platform
Thread-Topic: Support Tas2781 and mute led for HP platform
Thread-Index: AdxZ9TkHdwxlpI8gQJCC76hamazeYP//hcOA//93wYA=
Date: Thu, 20 Nov 2025 09:01:55 +0000
Message-ID: <f2462c6e04a04360a0f9f4cdd5f87af1@realtek.com>
References: <c9c11acbefa24f7e8d0c62daecc00ac8@realtek.com>
 <87see9axv2.wl-tiwai@suse.de>
In-Reply-To: <87see9axv2.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, November 20, 2025 4:54 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> linux-sound@vger.kernel.org
> Subject: Re: Support Tas2781 and mute led for HP platform
>=20
>=20
> External mail : This email originated from outside the organization. Do n=
ot
> reply, click links, or open attachments unless you recognize the sender a=
nd
> know the content is safe.
>=20
>=20
>=20
> On Thu, 20 Nov 2025 09:12:38 +0100,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > Attach patch was supported Tas2781 and mute led for HP platform.
>=20
> Applied to for-next branch now.
> A comma was missing in the table entry, so I corrected it locally.
Thanks.
>=20
>=20
> thanks,
>=20
> Takashi
