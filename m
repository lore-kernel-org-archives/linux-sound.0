Received: from sonic305-22.consmr.mail.ne1.yahoo.com (sonic305-22.consmr.mail.ne1.yahoo.com [66.163.185.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E42617BEB7
	for <linux-sound@vger.kernel.org>; Wed, 18 Sep 2024 23:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.185.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700606; cv=none; b=OZqzEdSbULvjBDjaTKU+BIIiPiWsgua8rwRBu948PgFuWSdKOfcnsyWUtS26yTaxAs2cwOxV+PPglRi8vV7CTSzRodFTOMSUGx7rhAXL56WED9P+KXqyJ4fMkD+djZ9YkeDE/b0bmrGkrJw5dd9vUbCNxb/R5nIX+y98WEUn5l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700606; c=relaxed/simple;
	bh=TiWBn4ij0rM6Sc9eRO6VT85g4w/IXXzMuAJPYI7Q74I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pi50LUgxZDpx/+jM/eyt0ueOu8HbvpUac+4CMQGeyVdN0aX5xQVPs1CA0FKvuCk6Zp8+2AwpDprSyF097l2udrd62SQruVLyjHV6JAAte15V1jJlYPwYgxosqo51iRd2afXEQDDxS0UozNX7op9WmDfHsI1DE2TOmUgD1rCD6fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=j8DBmRWq; arc=none smtp.client-ip=66.163.185.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="j8DBmRWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726700604; bh=TiWBn4ij0rM6Sc9eRO6VT85g4w/IXXzMuAJPYI7Q74I=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=j8DBmRWqPbEjTDgHddpzS3fusAAob0OqVnVsVebq8/WqIyAL4Xagr32RoBkQrYPfb/2r6GWyxrincwQCIE+gCsYa5NIaDiqqFNXP2yFNFEH9YLhnHkCedw3lwCoLcDagtmmJIPdUsCLFfGd7IhfsZc7MrLmbl70sGl+iz5fdvSqhaXfoCJHmAdUXB46T0uTuO/U0CSrY3PYwLBi2ho4z0XsgAg5m4v4i2eweFui9j5VINKebftaN8yo6Qq9/7msKsY23cm+ga67N/jRpZaPo4tpBynqu6IRCv2WWdPDyhpN57mYgHzxtM/hep9qA9HEFumv2H80XItHJD5YFJps1Xw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726700604; bh=HxRsoUBXWcx8b/23LIrgf/b9GkE/HFiXUSipb87mmOq=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=mgwZ9qGckZfAwXNxZ4rvE+gV56zwYSiG1tkqbIjDaXEVzfM/+wq3UzXtrh8g43rkOc1PsFNpiP3lS4MqK1/xLuCnVR+GH5t8tPa/ucLcK4p+Tc/1V0efZx39xhDFRaZX+m9775i0ocUDZ4O15Wf86dr5o38iWiVTzAT1jNnxZSouDVM5aOBeUI8599f3SniIx/F961BdHKvdJaBhLKOR6aItwCbCXIN5O+n5baaI3Ex4FGaF/NvVG6zz10FlePUYCfvyq8iQr4FICXhtK3sY4DhzVKNj8yYmJAUw+gaFbcSNGW1ZJ1S3aB48k49b0nFYkqT3Eh+XzqASwQ11sh9nXQ==
X-YMail-OSG: yEVHeYQVM1n9hUUCHKiA0p1ORUtmb82JvZmuy.u8cByS2G_0ChYFDgngCqaFlaI
 5ORZbDCoS6MJNC1QgnGGpLeWTNa83L6CiJzLdhYpMrE0YYOLzLryE_ra2TQikviikGcNqm.abvCz
 o235UJF3_qzn5DOgEbCE0kOJN4WOK.oMUU8nKr7A6RYA6Te701HJAKvVWBSGuJAddF2nzPVBCwvf
 WhyBs6I.80nNwd3gHjckngpIBAxO1E2dgyIweTKFTy4kMhwBBJvuyUG1MP6cT4k8KsxygIMhxG85
 IiN25twBHTmApbEsKjPSXdt2PwOccX8AmSwN2BslP1sqkq5fOGTdnnm4HnF_DEuAfpn8.LK.H.tR
 UR.2h4cR3cgHZ3tVr_Rt7gfbkid2KsB9rj7.sU4Z.LQ5y9CT_4sBRP59hhxcCmlmfXu5e.QQnmGZ
 u5SeYrra7xwhOF4NZJuTL5.GHbqZrmfqXyMSOi4mwuSoBk3uBRaieXdOd1mKcbZEfJZZ6vZ20ANi
 KmhF9Dkneyfo0_aUJM8qHA1ZjZbW46mDVJPhzF6EVRzDhuPFuLATrxBYrY6AjmjNa1uZRRLn7Ek0
 2b6hUbxOlCbbA9C_xvAGktRwR8g68ebza.JKH7HKwNCsOJINahIxy_VHXRvE9Xx.4QbCKqJpNTUF
 rBXHs32ICP0k77gNUMtF1p1Iw_04Hg8N0PFva2f4_zpFaEaUTFgyJAwcdva29sGHxEbqTsQVHdEd
 U01ojPnkztorQQWiB6wy9qMJJOt2rd7Pe46g7OQDUSao9GlLkYtUFeFf.UhEcXPaMgAVdd7Xfuca
 Mu0HdpgyVS7pzgNxXXmYmh0yOsIdsZQz0Wyqi9g9NRmOWlI9z4OpHJDDEFGtBib.yHiFDX8ftLXj
 cJZPS6RdUoTnyYEatm5g3Sag5fmkDFC0f92r0_Gfa_21C4iQX_OCu7idKkaRNqt5sT2HluEuMJTc
 _E00O3B_VUwWAhoe2_ojo4U0cxrWnqbgeQ5ErVte3AGgqJYwC4.JP3UQR704fsebrDJg9UwLrX07
 s2yYB_s44TvNLEMQDelkNxry.yA3850y4ugkqHe76bMh.YiNU.hw85yjYWHH7iaUqsdmsliMR3Vd
 Gavs3ptQlbHapXKYr7_wDV5zxpmA2BhiEuZi76Yz9Z7pzGFDFY7Pg8Ul7P5Tgif6h8vCVVAmGmQt
 DGf7pk9NOOB6Z3wOfJR0iW7FDTrF8yEHVriJ31lH.K2UFziGHULTlhxpPL2H3pWkiRcC_Z1sfye9
 6uSiI975dn.LQYZkjRqmlMsKDtk3jLRT0rzlDU.MH3T2gg5XDMuCpSF_I4pYsWWNt_a.4Ri7nHYd
 HfmbWQlBD8UT9HqmnDf_PtMXxlWfvfAUkdRIaq54jSkiW2bN.lSHqDpHQZC.NtV6kI0IdH3fhTcP
 EydCkSwmAHpA1_0ZTeTeHfQO71MwZ7PEoT12HCXaSM_s.yo1n.iCHxBnbmivXNd9hRmA.Xk31wGL
 x0gnx7OKZNhOI6QzO0TUcNqjfoNcHFs3FdbUhekQBgSuxiRwLmm4YMXeYQB2FuxIHVn47REwTGmE
 wr5KUgiWyIkHB_wCtmStIhPqrg71SqpU82WL4kW2tYJ8K5kcj40eLc1AI8Rcqz745VW963Bwv1c7
 UVVCi_J1PhhHIoRA03e_KHINO1QoCh9SdUCC_ERh2DTcJ2vAq3be97UNtfiF320gcGi6IPbJOE4c
 ZjCj5wrK6.0Qm0C3tI4a2X_12cnXlB5btJJk3t.ix96wnQfKlwqHvUKptQoYVxYTzMzXUqf5CmWW
 Mt7SAEqy7jgsfZE0yjexB0Guk5rzvBdBjyYi02LOopCB1Jhh1jovCaK.eI9H3a_OYD2aoJLuvIjw
 sBzd9wQQe_Hrgjr4lEWqv_TL2Hx06N6WrCgdUYVABOqWgdJHNEp0irkgIr.gCMpDFvjCI_zUJv_d
 Y3fjdUinHUE732xGeEzQ58_D_6PAo6phUesZ4HNDiZ6WcSUs9H0RMcF0.MyP_hYhTCIL6f4UA5E1
 XSKrP86aHQT_26FMrUnFSytAcJLUUKk_4w_DheoqC.uV4BU.5lsjsTNrY_vNo6DTAaS5pS15OR8e
 JmDBWXnbBHkHSxkFsaiHQ_.tQwdhJyY5vJcK4_lBzPou1dI3VvONESOJ8UvjWQ4SJE_AMX9R.ZmD
 7g_wf.C4nj1yHtHXKj2BHMtNOnmTQoTXiIclDSGKSE5uObzIUJeZ1p7FUZyzmLbHWGr9yGvzWszE
 XvuRy9RihAeHprd68H6T1A0veSkbbVGUa5QsEWmPALbHDBJFTQU.vE_LXbgpwd7fSjm7uje1bpcE
 1Owih942RbS11nGVygA--
X-Sonic-MF: <davidglanzman@yahoo.com>
X-Sonic-ID: 7194951d-9d8d-4a0b-baa7-9db863792556
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Wed, 18 Sep 2024 23:03:24 +0000
Received: by hermes--production-bf1-774ddfff8-jfmlb (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 527dcf53c9cacd72e1462865c142efe8;
          Wed, 18 Sep 2024 23:03:22 +0000 (UTC)
Message-ID: <4a9dd4e14ecf9ea1f8b25f18d618544c3a86bcf5.camel@yahoo.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk for HP Dragonfly pro one
From: David Lawrence Glanzman <davidglanzman@yahoo.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Date: Wed, 18 Sep 2024 19:03:21 -0400
In-Reply-To: <ZuqVVJJFPNbeurt7@finisterre.sirena.org.uk>
References: <229243264.8919425.1726551100908@mail.yahoo.com>
	 <ce69045a10eb78066a12f142768257d87761669e.camel@yahoo.com>
	 <ZuqVVJJFPNbeurt7@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.22645 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On Wed, 2024-09-18 at 10:54 +0200, Mark Brown wrote:
> This has been word wrapped, not sure if there's other issues.

I'll try again
