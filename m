Received: from fallback20.i.mail.ru (fallback20.i.mail.ru [79.137.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4832212C554;
	Mon,  1 Jul 2024 21:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719869220; cv=none; b=tfHZlszAnyc2rmmCGBpaf1nxcvrui3i8SZAT7UFl58UsHDwWnEsHyV1rI4tR6Sx5Sf/xgxjrQL7PHLBcMkijFAH7kIKKjs6U4bx6AA5cuFu9m+NhXSEOpi86J3ZC8GOwfblO3cO5I3OUyJmjIYWxjcgHQ1m7XqKr1Iu3vaMTyfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719869220; c=relaxed/simple;
	bh=HGkEF4lcnH+qevXx2N/hUawe5/qwnBOtlM63bp19uJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3aAeaEnGXnslcNYX139XLWAZkB4NykMAqOgXxRCCYlSmAHwNRFeGcdU2m+WTrUUhBSmuuKJAgoxSfIbQpP+GhF6jSIUqeTSxN7e2erUKBWGeOCMcEN6ZXk8XtpsCMB09alEEv3YZQnBzT0cflV+liXHALUhR2/73Yzu+mxLUdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=t5nb9fvP; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=MU29WYpD; arc=none smtp.client-ip=79.137.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="t5nb9fvP";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="MU29WYpD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=i/oVyUdCR6U4wBRrOrUwouvOgleqfCfvRfrhxua8/8I=;
	t=1719869217;x=1719959217; 
	b=t5nb9fvPT82vrXNd2oRAqrwPl2LSAUzT8H9bVkkDX8Sisf7p7UByAvXfjy2YfjF10ySNsVivlc8/pEiCxUky75UIVEmrTe7hGCQKowNH7JXO1jISbBA5hUTjUsEABg1wLJbDbleHmRS0QFewfbScQPsbGVTYiaP2EG+JPmFDyd4BltlBfN4bjBJOZPuhncgWgircUppm0+ZwusZxtAJiuEofjrv5xwIW0jehTJCwhrWSxgrTKrmwcPaWsyfaGwz/SCUnkj5BJjrft4wZXYAFvYebHLosE6VtkIGGNDESiQdkgpZjh7xjlXZ50B6wZGOO2kCnKUNRMIGZ4dJmLzY14g==;
Received: from [10.12.4.37] (port=53694 helo=smtp61.i.mail.ru)
	by fallback20.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1sOOOJ-00Dmlu-2e; Tue, 02 Jul 2024 00:16:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=i/oVyUdCR6U4wBRrOrUwouvOgleqfCfvRfrhxua8/8I=; t=1719868611; x=1719958611; 
	b=MU29WYpDJduRs969cRrck7e+MJa2+WEBD6pFTOdWloBd1SneDbhxrzSQGA8WJraJbPHPlhxwcKz
	kTaiBnjle7xsakjUw2cpeX0kiNBjNtsq8Gr8p/L7VUcF0/QC7W5qNVO/ez0l1xlzgu+WLwfeFeJZG
	JzH0w4RzNWqDQPPudMSH32/JvE6O6hoBNiPKhT31NW3MrdlYJ+TYOvTJiCn+19rB3D+qd0BkWH7a3
	KouV0/QF8/GgiYCcMUryyHlZL0E9TUMdis1KZg4YWSFuhz2k390nACXbPMVEZJpNqOJQSkbJES6L6
	zR9ee47Bi6pnZy28/NhP+MajeVksJW5EPlnA==;
Received: by smtp61.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sOOO4-0000000HXqS-0WN6; Tue, 02 Jul 2024 00:16:36 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Hsu <KCHSU0@nuvoton.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: nau8824: Add master clock handling
Date: Tue,  2 Jul 2024 00:16:21 +0300
Message-ID: <20240701211631.92384-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701211631.92384-1-fido_max@inbox.ru>
References: <20240701211631.92384-1-fido_max@inbox.ru>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD916CE66F793C0480225FCB3F685FD1C89CA2793B104534974182A05F5380850404C228DA9ACA6FE27D247BB7565BA393F89CEA9C911D099954B57C4F626803741E597827C598CA07429C25ED172725C63
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C2204D4F9A221771EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063797024C28700A46CB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E072BBCE38384E95D012B7F63A9194D3AFEC760CC299C78520879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C4E7D9683544204AFF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063753733A85D94CE7A19FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F7900637F9425D8FA97DB4396D1867E19FE1407978DA827A17800CE773BC869C69ECC1572DBA43225CD8A89F83C798A30B85E16BC6EABA9B74D0DA47B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A58CCA0DB3962BF2075002B1117B3ED696773726BAA4FE8E8C7E0012C66AE17B00823CB91A9FED034534781492E4B8EEAD69BF13FED57427F1C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF6A24D1083EC183048C98BA5C7C7671DD8D74D03B5166C2F605B01D8F696991EBACCD0F0CDF7B38979DF1169A732047E3308C5C702036253EE936252639E45A3B5F7F135DFCEFC6D5457F7985AD47CF5C02C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojn+1t2APtxW9F2kO9LoS5lA==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9BDAB720856E5F194DE0E5D55A3A4A88C5E02BB9B6B840F2AA90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4565E9E3B8D953FE21ECBD88C55622FA010A45885EEB26E3768F3CF0E9FE49B695C5F89FAF04D5293676489BB354715BC679007DFF80EFA5A833F5E4F4D2157C1
X-7FA49CB5: 0D63561A33F958A556A2C392D819CFD59FA6FD7A0F0811C0A065845CC36879ECCACD7DF95DA8FC8BD5E8D9A59859A8B62B7ABF3321926E07CC7F00164DA146DAFE8445B8C89999728AA50765F7900637CBC60B0CD3BAC473389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8C8A976F1B976E0ABF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE71D0063F52110EA4A731C566533BA786AA5CC5B56E945C8DA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojn+1t2APtxW8Kw+XFJ7IVXw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Use master clock "mclk" if provided through device tree.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/nuvoton,nau8824.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
index 3dbf438c3841..232dc16a94a3 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
@@ -23,6 +23,14 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  clocks:
+    items:
+      - description: The phandle of the master clock to the CODEC
+
+  clock-names:
+    items:
+      - const: mclk
+
   interrupts:
     maxItems: 1
 
-- 
2.45.2

