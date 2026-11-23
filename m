Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469557;
	b=JYnZp/EWQI51IkWTkvytQB3OaRIJgO7XDQP4eOuWFT2NK94gP/9rkr7hxJkC+T5d0+Hr
	 PqUN3rGGgnaFg0GGT/wboD6xU201wnrlsCfz8zKKAr3q4MMMZohfT9C0VE0/Nh1DRQK7g
	 eiub6pCwSBq1Qdxswl47S2o2GqJrg0rVI0CMrOwbZgYqpxxThZQlwQRrRCfw7X5nP3WgY
	 kEdcK4r5Ig+YnDhcerZjFukXmrv5raJovNzn0LXF/9c51cqBvzHNLHhLp5OMfKZrIwF9Q
	 z7xJq9TgX+7nPi1CTohfeH55jZuOwi4oaNcMaiCAAumeBnuZvylNGGD+J6wCd1BSrNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469557;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=gonwIiEtA58Dq5m49AUGorsOuHj8HMCAUzTMZMjB0vE=;
	b=KC4atJyM4jdQq/nA0HmebVygMvxIZvUx3F7F4H/uP7Crinb9oDeCql9w6+tiXNGSBW+Z
	 uLBhrac0cbrX3g1UhRMYpuy8IZeU7XRpgEJxXHP1CWPm8qWFqzIK0cyJnt80u0xwZ7VWv
	 eo03R9ykECnB5omHs5YLTsDHX7nln8XIszcFUYDHUYvL7m3/9o476dzf9+l8iIMDMyKtf
	 DxxcHl5u6O1FzN9vF3rox8qGqEVzDs/WdzPRjLDcUVJN1hlfTB+m8/5gzusLTDwLzxtOC
	 ENt52wjNxqu8xNW+GwfX0nkKr3xgYCmTSbNFFniFreaWthsR+sfkIR3wRDyCAr1uI5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=paltian@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=HnX99wur;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A6606A326
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 21:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 818A6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=paltian@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=HnX99wur
DKIM2-Signature:  i=1; m=1; t=1795469554;
 mf=PHBhbHRpYW5AZ214LmRlPg==;
 rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:kelEZZ2IPvE1UbLy8lprAKEvk60O
   iCglHes6BEfJgSR8JXRB3RsPt++nMbagh9zq+jz86AgppndxNDWq8hqMnL/3TtDjxsGTJcL0s+g
   q5nV2s8rs48E9rwcfmTe2auZRtmxgRT5tIvxZWiiT7tTDVl/wQfJilyRLCb7QfxxvjH1jCV5jLc
   m1AwDi7zZnbvnZXmEPBdzoIX+dohfZ35nBDOsBZxIulq/oh8cS7Vfo7wxTp0w5T9r0h1WFfRI7g
   xMpGYLgooM291XaBRJQtRPyygU3DUrDnWozlAlgx7QOtgl+2tHEoTa2ojTkcWX77Uoy7dAOHaeM
   UNm9VQW94WHehQ==;
Message-Instance:  m=1;
 h=sha256:
   7Rht88oY2r6A3Vn20tp/RWBLWkRfxpbT1kpxOXHG6Xs=:
   IrQQ3H2Mmr80KTKQj3NGz6g3bsFehEPlNi+B8XTD/sQ=,
  sha512:
   3fyJHNE1C/+Uw/1QF21kAT6MG9gUAIAitQhAnLbfFsuDC6sd3HUMY8O3eBegGoJBiZgScJHDrRYcAnJtLoqthQ==:
   w25Unq5Vl7LMK4JUGdWhvYoYmH+4iW1hBcHxwjsn9lomCtKo6UBfmhT00ltoD9cFz3SRn2JkNGiNW9lxFbD9+w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795469550; x=1796074350; i=paltian@gmx.de;
	bh=gonwIiEtA58Dq5m49AUGorsOuHj8HMCAUzTMZMjB0vE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HnX99wur5KvA4GYw8vDmqUsbg/QRuK1J8JIdK18XFhpBTjM4KSKVN9tLPtaxMGbx
	 2CAhuEchvoJdI2zR+SwaqcOucDrcx0EnuGiqyVKisyIQqp2NOOGyU/MCHG+Yjfhok
	 7AraSdCzIGDypKuvu5TaHCnps2NrleX36smLOao0FrBZsN2+6md2RDV0bgwYTiaQT
	 3CZ5uSbSexDQwEV7bGEPeY+pdwTzPbSluANeZF5CIQFOLXXTmon3mbhkNoBpoC8AY
	 ZmhdcB7tqFSbLW4COL+aqCC7wTCj7zwp1P8Ht/CazWfnQsSVEBt/+L0D6M6HcObqF
	 MbEt7wOYX7w/gEZ9Sw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpJq-1y5Da82762-00qix9; Mon, 23
 Nov 2026 22:32:30 +0100
From: Markus Paltian <paltian@gmx.de>
To: Mark Brown <broonie@kernel.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Paltian <paltian@gmx.de>
Subject: [PATCH] ASoC: amd: acp: Add Lenovo IdeaPad Slim 5 16AKP10 to ACP70 override table
Date: Mon, 23 Nov 2026 22:31:53 +0100
Message-ID: <20261123213153.51026-1-paltian@gmx.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hMXr040ciBNy+gVzVdVLIJN9vk2ZKLG11nyZOER/jByMOJq0ieE
 4mmCkb6JLnzDRhFZDQPbTqYCNezyI+1Xw2hzZaRJ7pFyBIejjajj7w1VNplkm18B8ZmsvS1
 rMMqHhO/wsgEDVIDmxME7wIxYncW71SHiCyE9lx14DCbCeoVayq1EaMJw4oLm9R4YtUGwPj
 6F74h3QAGkToJCcAC9PPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RLfWVfSIOII=;b9po0nzj4Id31S94l9hsRb8W2X2
 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

The internal mic of the Lenovo IdeaPad Slim 5 16AKP10 (83HY) is wired to
the Conexant SN6140 HDA codec, but the BIOS still sets the ACP ACPI config
flag. Add 83HY to the override table, as for the Lenovo models 83W5, 83V9,
83HN and 83Q6.

Signed-off-by: Markus Paltian <paltian@gmx.de>
=2D--
Tested on an IdeaPad Slim 5 16AKP10 (83HY) by loading the patched
snd-acp-config module on 7.2.12: snd_acp_pci no longer binds to the ACP,
the dead acppdmmach card is gone and the internal microphone on the
SN6140 codec works without blacklisting snd_acp_pci.

 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 93c9a11..e2cb6e6 100644
=2D-- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -72,6 +72,13 @@ static const struct dmi_system_id acp70_acpi_flag_overr=
ide_table[] =3D {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83Q6"),
 		},
 	},
+	{
+		/* Lenovo IdeaPad Slim 5 16AKP10 (Krackan Point, ACP 7.0) */
+		.matches =3D {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83HY"),
+		},
+	},
 	{
 		.matches =3D {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
=2D-=20
2.53.0

