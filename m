Received: from send239.i.mail.ru (send239.i.mail.ru [95.163.59.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C1E1531C0;
	Thu, 19 Dec 2024 04:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734582180; cv=none; b=aq1D9vTBqCSmfAJ9d2THlzAkwyqbSU5WwTpabzC1JXJpSyjPeNdJNqn3cuEWz/rms5NdlJwR0NnqrShWObTbW8NrWgPkZvfzD0Gw8tn209LT354T3YKOMacuIfrurobI4Dr+KUv4YXMjEJlmn2h0nrFupj6nI7lzSVneoWczZk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734582180; c=relaxed/simple;
	bh=8APFJlVugmGaG41UhZJaxGBv+wc0SWzr3vlf3cYAeoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Py3obHViJ8vLf4k8oTY0ZSZSFED1Tl2FSU43vBGphwGbqJ2JurTNZrxDhVC13MXTIUtAWFLbnlytc5q92DBMH49JhmM8vw9LqC83T81cP17Ab1V1fIOWZquo0lrkGgEa0sUmbLrD+B4EQMerDGh7A73CA+EWG/tQOTHg40/rXTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=Ffet5zIg; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=BfYUf2Hk; arc=none smtp.client-ip=95.163.59.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="Ffet5zIg";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="BfYUf2Hk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=AjEIRJC3Is1bLGnw2833vNMwqkuOGVFndyuTj9mTugI=; t=1734582174; x=1734672174; 
	b=Ffet5zIgDwqR86Zbq1ff2ZT6U4wwyjk3Vw39ImZaStdKFq0raQVgq5lkFpyXYUIQCbb1YKgTLaq
	ycWmcZ6Mv9ndCUWGQrkj4yWw6oDNkkGMJ6sRo7sj/t7q5ns/+FtHvmBeoH+qxreQPF3OTDiQYypfz
	yWdV4wdlfBP4ydSLTqEx4xCrQBezkRb18TzP4wEBCbsQMde1yxGAYbRhqsN8EvcEUeZgJRkFE+8+T
	d88WOFTF8EispxpdQN/XCDwTYCz/fQteaiH/B3MRtniN7OLprMdlldRXjJOft72VqpstXjpYmuxau
	HzBUR8g03cNmrJJ8fQEjcTD99N0NKOiSoGCw==;
Received: from [10.113.75.12] (port=50110 helo=send219.i.mail.ru)
	by exim-fallback-55949dd684-zgqc2 with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1tO83j-00000000Foy-0leK; Thu, 19 Dec 2024 07:22:47 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=AjEIRJC3Is1bLGnw2833vNMwqkuOGVFndyuTj9mTugI=; t=1734582167; x=1734672167; 
	b=BfYUf2HkKKiYbL+B/4b/vpo7XWSY5j1hQ41y6ja9gAA1LFjWrzLN+4BHvyhx9SuSLA2sblUku+a
	T442QLRus8BBArXYUY5BHW7gN+yYW+pqOV/t/rymfiEmFdBWFednCevUsK2EAErYyIIMaEvgH3+9z
	squPVjqYnZQN3v3FzAhR+68h1WyfFXK9I3qtcvjNZxsW2BeYc/DmOayWclW7m4mV8BbV8LsXTi7io
	rxTKdpVqhokLFXdD77v7N3dpIfhH8Pe5w3MDV5uOnZquiqSmqArdKH6M/jMbLJ3xZuDDQtdbeKnRg
	L3mfmIG0DPvNtS7OR1MK/q1LBHzURWFvdV1Q==;
Received: by exim-smtp-cc4f974bf-662z5 with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1tO83S-00000000GB2-2xlm; Thu, 19 Dec 2024 07:22:31 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: andy.shevchenko@gmail.com,
	u.kleine-koenig@pengutronix.de,
	tiwai@suse.com,
	perex@perex.cz,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH v2 1/1] ASoC: codecs: nau8824: fix max volume for Speaker output
Date: Thu, 19 Dec 2024 07:22:27 +0300
Message-ID: <20241219042227.7075-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD927BF2C9B6389F95E798FA003F3AC4E174E81B70A339AA402182A05F5380850404C228DA9ACA6FE279CAB95BD2DBD6D243DE06ABAFEAF67052942474733F93CE4029960CA417AE6C283EA1B0D5B4973F7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE79B5CC362CEDE941CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376F978168E59B07A5EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BC08E230531AC9C903B177BE24D85C3D2646B385410958285AEA615C3C489F0421DF9E95F17B0083B26EA987F6312C9EC9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7A6779F98BF527B7A9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3ED8438A78DFE0A9E117882F4460429728AD0CFFFB425014E868A13BD56FB6657E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407978DA827A17800CE773BC869C69ECC1572DBA43225CD8A89F83C798A30B85E16B156CCFE7AF13BCA4B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5737E5AABD7B84C515002B1117B3ED6966E106937FF1B6DB133EE06AFCD964888823CB91A9FED034534781492E4B8EEAD2B25D9E4C92BC8ACC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9F4F15B0C9885B4780BDE15F42A7988A481D36E7F87C7C0573C114E1A005838735D245DF744597F124A398DE2C7926ED77942611A52FD2AD5655F8DB286B12E7535A8F4ACF0DB1654759C7B6195DDAFE02C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojHq2Ii2MsWRvfAsuL8sgd5w==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219CB5E8C623EB91606C93EF268E953C7B17402DBBBFF79AA3A90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B45562A35114C4D62A143C92C1EFD0EB2A13D7EA1F794123AA049FFFDB7839CE9EFFCB3CFD0F8D0EA3CEDB4C01C950DC5DC6EE2F0F4F080DD1A5E7BE6A5AADB75B68974BF842EC8ED5
X-7FA49CB5: 0D63561A33F958A5FDDA165D35486A355002B1117B3ED6965166E205A77835AEDF65068396D3048702ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSpStNuiRPs+SpzUdJfQ/bjz
X-Mailru-MI: 20000000000000800
X-Mras: Ok

There is no audio output if Speaker volume is set above 25.
According to datasheet Rev 2.5 maximum allowed value for the
Speaker output is 0b11001 (25)

0x6D CLASSD_GAIN_1/ 0x6E CLASSD_GAIN_2:

Left/Right Channel Class-D Driver Gain For DAC Left/Right
Input
(Step size is 1dB.)
00000 = Mute (DEFAULT)
00001 = 0dB
00002 = 1dB
...
11000 = 23dB
11001 = 24dB

So adjust this value in accordance with the datasheet.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/codecs/nau8824.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 12540397fd4d..5aaf8c496300 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -368,13 +368,13 @@ static const struct snd_kcontrol_new nau8824_snd_controls[] = {
 	SOC_ENUM("DAC Oversampling Rate", nau8824_dac_oversampl_enum),
 
 	SOC_SINGLE_TLV("Speaker Right DACR Volume",
-		NAU8824_REG_CLASSD_GAIN_1, 8, 0x1f, 0, spk_vol_tlv),
+		NAU8824_REG_CLASSD_GAIN_1, 8, 0x19, 0, spk_vol_tlv),
 	SOC_SINGLE_TLV("Speaker Left DACL Volume",
-		NAU8824_REG_CLASSD_GAIN_2, 0, 0x1f, 0, spk_vol_tlv),
+		NAU8824_REG_CLASSD_GAIN_2, 0, 0x19, 0, spk_vol_tlv),
 	SOC_SINGLE_TLV("Speaker Left DACR Volume",
-		NAU8824_REG_CLASSD_GAIN_1, 0, 0x1f, 0, spk_vol_tlv),
+		NAU8824_REG_CLASSD_GAIN_1, 0, 0x19, 0, spk_vol_tlv),
 	SOC_SINGLE_TLV("Speaker Right DACL Volume",
-		NAU8824_REG_CLASSD_GAIN_2, 8, 0x1f, 0, spk_vol_tlv),
+		NAU8824_REG_CLASSD_GAIN_2, 8, 0x19, 0, spk_vol_tlv),
 
 	SOC_SINGLE_TLV("Headphone Right DACR Volume",
 		NAU8824_REG_ATT_PORT0, 8, 0x1f, 0, hp_vol_tlv),
-- 
2.45.2

