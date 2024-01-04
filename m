Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com [136.143.188.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1922C1B3
	for <linux-sound@vger.kernel.org>; Thu,  4 Jan 2024 20:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zoho.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zoho.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zoho.com header.i=dufresnep@zoho.com header.b="bhWtcP5A"
ARC-Seal: i=1; a=rsa-sha256; t=1704398823; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G5PBiPCTUM/n7hgYeqS/OF6PllZ2MtU5Ogn+iym4z7z5q6hJqEB317ZiaESug6dF/kEDJSmUYqBrQC9VzxTOC8hba1oSx4cjAJtVA7CvfOvnCBBcvzVIsA9O/MzmfAf+xNHhbUuaPfA9pMVc5th8+QhmUjjOXLJrMESlKGqIX6Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1704398823; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=ugqgT7WUa/4iSd2ZIpnA8hNpAxgMSiosGkgP9tB2blQ=; 
	b=QYmnq7s69ZVTU8jdcQKgA4aa2ZNaWsJ61FXSeAybJ5tr1I2ASTBTYpUveP5ex47Jo9EXRrNX+Hko5L2zg0odtc3xLTuTEkdaPqvXLP8XoEBCQck0I3sTdHEOmg8wevEcOdE2gYlj9zVPa15MtqriDfGF7/YAioRU70+Nz/29W/Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=dufresnep@zoho.com;
	dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1704398823;
	s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
	bh=ugqgT7WUa/4iSd2ZIpnA8hNpAxgMSiosGkgP9tB2blQ=;
	b=bhWtcP5AXQER5E/38djXlS78OOwPX3TGMQFLYfSaMPfpt3D20HzzWEBFL2306EPO
	vTXGj9QMKuhxcpAJqZq55p7SCkNLOiSBf8Qjx4wrtREp1s3+3586qXHKr8NWa1wMIuT
	oYQepEH4rlbrFdS6HpI4W0d5NYGXZQhakDRcVjM4=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1704398817882824.0897225806434; Thu, 4 Jan 2024 12:06:57 -0800 (PST)
Received: from  [66.129.153.16] by mail.zoho.com
	with HTTP;Thu, 4 Jan 2024 12:06:57 -0800 (PST)
Date: Thu, 04 Jan 2024 15:06:57 -0500
From: Paul Dufresne <dufresnep@zoho.com>
To: "linux-sound" <linux-sound@vger.kernel.org>
Message-ID: <18cd6160a50.fab2d78b18060.4664531235381350291@zoho.com>
In-Reply-To: <18cd5be2bc7.e19fbd7b17331.5233193232348276602@zoho.com>
References: <18cd5be2bc7.e19fbd7b17331.5233193232348276602@zoho.com>
Subject: =?UTF-8?Q?R=C3=A9=C2=A0:_Sound_Blaster_AE-9_freezing_boot?=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr0801122846fc9860e9f5699a0eadb3da0000fee6804aeaa99b45f443ad7c5ac8766f080f5503ea2edcac0962:zu08011227ae7472d0fe21e32fdfb6ab390000b852da29f35b70e98b7db68572bb4b8551d7ce0d93eaa3fe77:rf08011232782c6a60dd4c3a71387f937200003f394de5b71b3eaf51956e1767beaa5a6b55c61fdafdd5bc3bc547157fd3b0393ef21478:ZohoMail

I have open a bug for this, and consider it the more appropriate place to respond:
https://bugzilla.kernel.org/show_bug.cgi?id=218344

