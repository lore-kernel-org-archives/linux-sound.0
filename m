Received: from sonic307-9.consmr.mail.ne1.yahoo.com (sonic307-9.consmr.mail.ne1.yahoo.com [66.163.190.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4D1186E51
	for <linux-sound@vger.kernel.org>; Tue, 17 Sep 2024 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.190.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726587669; cv=none; b=BdOSuirfxgSca3Oc15U6kJ+tJ4oyCS8tsVITslWiPx1wfJYjU+qCK2qKmN/soXKehfiKI9H5uYmj4OjqAgw7wgW8biB4P5zU661xWkZrw08bXGtXumKNYSfsJ8h6lDUHQejz9uGNnxrHDqSRKtbChHSqKjmm6CR/lzvwiLMeyy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726587669; c=relaxed/simple;
	bh=q2h0KRsycBXdmeh6/x2o/HvMsqDvhkRF+vPSPnalVnY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bUxu9hai7gAs5is4jh3Gc3cCf9P+WgisDAgPZZ7zotRWR0e8nZjxW/vjvQyuhHvKT9/UL+33ZMrjQw77CRHoLEvoIa/kxxdasrA6XLjHV943k4OESXkZhjUs2qwBZE6YCoLnDyclwwnwkm7aE9DDY8SoU5OM1vWdwmJGk246DhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Hn0E50Fa; arc=none smtp.client-ip=66.163.190.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Hn0E50Fa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726587636; bh=8bAjZyhNfWQ7NKNy8Xbkx0f9suxTtSB+a6UrRAw3L4Q=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=Hn0E50FaILVirOhsapK3+XcLWy46fofgx78NnB5p1oJMNetPWeYvPl/M4moMPTSw0ohbm9GL1YjZiewqAfDCkmbTTB8Jh/ME9u8cJK38pd3/fA7JEXaIz/ncOeh/iWO57G5gzZqwzw2TkIzalmbtPc3x9XwWziQ9x+gGxTJn2SSALV8ClKgHnKaWt6xqTdh1lbfgzGuP/vpzsDV1zbrsKb+k4oHGZm9gHaI7J4n9SGJgV0p8q/IfhI6IyRNC0cZbBIz0MlFtbulUq0r93b801iKY344eFqHQL0+w4JsY268712K0bv0+ISJf72vE1+RWY2PiCS0vao3naEI4v9h1yQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726587636; bh=aYJ/T6azK7uNvw7zx0nl0VrL2Gf86ADQ25BHNmKKtUN=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=rp//TguItbychKjR51IgTBNTl+G74sU876Uod2jyD9aeceYCddzZ9MZTMIGYXl7dPXQwQCh5e+XDSJXUV1JzO3CuqECCIExQaPyWSeIjIkBn1S+0f7eYidsTmZ2B5qlptNtbyD4rQKSRJsfLIbKihbBOVP5j8JsjTftIAAIhOuuQ0I+zJQJhjtdXE3avUe0TFkauzovUGopAzzr+hFMiH3KYPsq+Nq0LhP8qqjFnCpjRdASbSyB7J60Ye2jQt1wsTzgebwe8hO2zSEJKwOiOd4zlFoQoCX5oMixJFnNeyHsBFb+xZpKlEL6EI8aCWDJzmu3k33sbW6B0UshoIokgNw==
X-YMail-OSG: biRZPGMVM1kaM_74wUj6vdrQswRBmjfsRWHbJBHk3ormkBgSS.BagGef7yBNnMb
 9hMErpFwBal3ZXSB9Hh.rq0nUJdMRax_NeB3SmaQZYQPiPI4g0pkTEcw3Q9Ey5u.m3xZSez9hhoc
 bMjaA.iyvVHU5D3dG7Phbf0K5_vbx90hsrRhXv8vqGiFk1bVijchrQ65WWrgeKeLhasTIaE06Owj
 nCiPprrcxbra5_HN55da7baGiMtU.mfDHsW.3v5jWwdhQYHjFrdKK4TtN6S7qOXkg1Q66ktziCf_
 9wkS0aPe0jk.hiGX6DmrIq95VT5UV1O6mcCX2E7nKXT3iRpCbQPQYQIxSpASsb8_JvAJ5Fxy9PYD
 PzTvmT2mjfAYJJZDk_d.emBC2ounDCjROGnQd7oVCNpf4Lxg6u2Z9GNpEGtMJh_.tmPfOEmUzQe7
 6P5nGz3EAHLtzyvVZ4fCtPQE1n0smU2UTyBldiqIqoNte86eBFKMWsu_G.1e1mGWA0u5ishhLdrz
 QogKvF5h5b2Cfj1cn9rIA2EmxOryj7q5sGvHcScNOM_i8ig6fdZ12Di1hTVTPN2A.lXkgSVzEnq2
 WPWXNja.5O53pNiRFQr5CxpX3CgfCkh706_o8G244h7ZxTXE7FebYuK7lGtG09usoXpxDCJDVKfk
 t.54NIgLScONe6ClnG9Z0YmOsCP0np7DRqSIl7Mpw1IVgCaCtgvw8SbcuVvG207X6hrX6fjPCkpP
 apEqp71EUqVjWgiJ7s2dly4dwTeqYIz4iiQTWgKAJiFoBXHTJsX97HFVYJfh0VxQli4Zn4gghaBu
 D45DdjSAjyDgNTX05hI7REuQ1q7xnYwXppe3c17mr5dpP5AAT0n1_oRMqryu.3XN3S5FAtZ52p6S
 CDiO_ZgJ.tHvAyOq1lrhEpe08DjDRwSXs6RL9fv4zmhJVWXOS8WPywJLRJywiJL5NudTmsOKR3PO
 QUf_EV0OnmEKgCeq3yMRe8v7wlGdMfz2wqIv.hAGz.fQPHpRepk9Fryx12jB4wNYiVvFmnPkll8i
 qAbFzMnzeQ0Zv3vJpNePd0PkvY_khPvOi1CJQ6zXGr7XtMUM0qp4EqvByKvkdy6t.NlRoxF7KJgw
 B4GJKKjf2DXeqPvFhBVNQSNdsGBcNt4mv2h_MyMwpnSaAv9BDp62enPU_c32mYjmwVU02v.rOCj8
 agr_7S6_4otwyVLCbC4UcYogTDwNUtY.z0rn6u4swqUOGrUp6GBnA6cksBjJAqDKaiCMP_4qx2Py
 zJ_hMakweho3jeyOLkaTJC89C4GyW5zneHX_ti0koBiXcdbvm2H9RHQ46qLn0L5zcEPghsGIGBC6
 uZ5xv.5Yc_NPyNzqvmOeZotk6C9QWimi1GZ6pMf3rKOGMVyjVw9PXoJqtewKgn4C_Q.ZRp7x_JJ2
 kwtEV2kX9vAJmIHdA3wxd_jBIp2TQpFTzZcH13HW_ceSCXo4Buk.RA8U25iK.1rBGFbhI93tryoX
 rfYRsMfZ3Rl7Ntwdaut673UujcTQx8yOgk0ED8v2G1DJ3Q4gzfdX1KIuadQAGX4DhSqqe5HDyGmV
 8xHVxzIP.v27gazAiItinjNQbCt8VWRW7O87VlVzQny5cc16GsbD0mWsSLx7e1MoG00lPTsac_cC
 XufT_JqDBmpzIzb6CBh9GFaFc8PK3rE8dtyia3lJbPvf6PbAHTOahe_XPZLeSVJRMgFjykRKC6bm
 BxcBF8Wui4rem0f75x70UKgJmAewxSB7VhfY5jUHfT2mhxRwPlQORX_jvFnrmkvRpn1kv4wiGnod
 toJMbLOaFzRFJ294KU2ShVplsQRMsrX4dA6UYAA.AZv2m9ekGZeTrjo_Yp96E.Cco6WZHU4_yt5r
 0omDUQZVKjjYcg7THAXf7F89i60Rv71WbVE21txAZAy1IRGq_t9AK5L.jByzDV6f5tAnexM993ml
 6dA8qOPxEtO83hvHrTd1N0jHPajIg4T6ozCRExOMWPSRS4FCfCV29gnDuvtHmf4xsEnwyfaIM04s
 lnXZ_sZ3zBow8Kt8cSw5ltjPuW25ksjr7Yj.rYYqrzuolVQdgAreQY02KLg0QbnSNQmqrO4HbEEO
 huvuIP4N3bcwWocYyd8L21C3V8Escaje4Wr4dP4bvEiPmiR2hWTt7SynPfEjQaRXcxV5vlPyGxpl
 A4ZT8XdPHIOmCY8Yn8H4UVS88OefTGqP6tO_534.F0ZqagSpRpeIiqzHrFbRxrbFueyBh1Hjn4aj
 oh8_uiiZij4puX1I5ouAlGzQkOSTPQVjuhSZkZ1Rv6ivKVRDNbwB9JD9.NTsSDtI4Yy2KugNYWxz
 5LKrs0s706YyOvre4
X-Sonic-MF: <davidglanzman@yahoo.com>
X-Sonic-ID: b9ac8c83-68b9-4aa1-b0c0-bb78d7690ee0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Sep 2024 15:40:36 +0000
Received: by hermes--production-bf1-774ddfff8-xjzs6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5dc9ae9759327e947699ed952672cebc;
          Tue, 17 Sep 2024 15:40:31 +0000 (UTC)
Message-ID: <ce69045a10eb78066a12f142768257d87761669e.camel@yahoo.com>
Subject: [PATCH] ASoC: amd: yc: Add quirk for HP Dragonfly pro one
From: David Lawrence Glanzman <davidglanzman@yahoo.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org
Date: Tue, 17 Sep 2024 11:40:30 -0400
In-Reply-To: <229243264.8919425.1726551100908@mail.yahoo.com>
References: <229243264.8919425.1726551100908@mail.yahoo.com>
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

Adds a quirk entry to enable the mic on HP Dragonfly pro one laptop

Signed-off-by: David Lawrence Glanzman <davidglanzman@yahoo.com>
---
=C2=A0sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
=C2=A01 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-
mach.c
index 06349bf0b658..ace6328e91e3 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -444,6 +444,13 @@ static const struct dmi_system_id
yc_acp_quirk_table[] =3D {
=C2=A0			DMI_MATCH(DMI_BOARD_NAME, "8A3E"),
=C2=A0		}
=C2=A0	},
+	{
+		.driver_data =3D &acp6x_card,
+		.matches =3D {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A7F"),
+		}
+	},
=C2=A0	{
=C2=A0		.driver_data =3D &acp6x_card,
=C2=A0		.matches =3D {

