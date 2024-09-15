Received: from sonic314-20.consmr.mail.sg3.yahoo.com (sonic314-20.consmr.mail.sg3.yahoo.com [106.10.240.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F88BFC
	for <linux-sound@vger.kernel.org>; Sun, 15 Sep 2024 23:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.240.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726444330; cv=none; b=H0WZmPFKCDT7tWj4nIRFbys5Il4TELml5LEwY+GHXN/DxTRP90HO9hLZJd8/I7zKxyAvPLyFA6M//gwKNSGWt7tNNsh9TCZQCzv3MyF8qOrWmQQjMUcKtts8Dwpnc/l/zISJQB0LGI/vrczKp+PCfJaU8GyAYFW9i8gCtg/0hp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726444330; c=relaxed/simple;
	bh=JhF1+toXV3G2v4vEZXAzxyNXk8m1d+R/t9JppmZ7wTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=l0DzDRoNhuCc4LTt+5M9b1Ky0wKklZyqZGkLI0D9DysslkjqJ4vbDc3Pz4EinUMbHVKMySXVIIR9UqdcXA/djcgknmZLSOHApB0uNKRcoyGqAYyTGBIgPOJhhdbfBvHZ/UJY22Bh0tBSp3+9/tkBuZ8L5SOvGk4fQrAL+sKSe0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com; spf=pass smtp.mailfrom=myyahoo.com; dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b=mPLOBu7B; arc=none smtp.client-ip=106.10.240.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=myyahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b="mPLOBu7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=myyahoo.com; s=s2048; t=1726444321; bh=5oNiWVZu9ZKL9lEl58ZCtsgJhu3V38tnkSoSEzwX1ps=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=mPLOBu7Bcv8Y9ZvJn/PaLlLv1ZeOwSOTYcp+4OO0ZoItUJ8jxZ/sZnY2VHDqIbu45tA6ll7Pp/J7P6I9rOy9s8sDAL1M2eIdIHriykU2dtV+payI9BnWA5vgb491zE/WON0onc4Ys/NC9ruKr5L6OjyxRJfsAjz3W3yw16/P5r+e6sdUO05p87Sex2qlCZ3QXB8i13zMnMIqi9WFgKVcExczDkUdpNoZ0RZzMwUnW8kDCVjlU7fbYxWNDDA3y7+B8ShmERepJ5JI9FrfEKe7K9cgZ6GORkKIEyHvMwrfLADy8k3p4YKG1vqQdmtQQJ3MixxWTIpf7B52AnyIGJV1Fg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726444321; bh=bRilfFUjM/bCI4Ie5k3tYvzZEKw1qdEuqhtDRfy/O9O=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=GthEyIUpj7o/mV3R0qTm5AZd4ZWWQS/DemU9ayVm11PRwDjl5eeOjdU9p/yaWKF40U/Xbo/5/mlNgx9FEXxZjsx0M1Gs5N4DJ1KgMXi2PZV5Noewh+lmDEZ0O1fi4Edvrjd/zPvL/X8MLIrQnr5oPBFGh6c0QKL3fkLA+1IAS+gCY2O1LyCvjBoHsXuPFIyZtH26+4tzqr1xQ4jK/nVbnhD7OMIKs6v/HaHfPgNMBEASS1oI5yQEUGPk8TIdZg1ibCq6RHLueGqKoSzBl54y1xN4sTllIStCLRNEifAOjb0IbCKgDbECILifluyw+RzzOgQ4Ip9Sl8KKhKIvSb/72w==
X-YMail-OSG: a6pW.YYVM1kY0k7DyG9COzp8d5y68xbKRdBg1py.BrYvsCRykSiFvUCGXBfYrpj
 dSDOyDRWj9UzQB49I7CEslXqumj2ZryoOKE8eJAVvUbZ_mA7BGmIf7NqsOAN98I90i6Cs6crneow
 ffMxzYfcfFDuHWZkWaBsQtz5wVPwpoUY75uLO4sVF3Kh0jjMswsdzImZl2TqtZ.jnX1aKk68fX0F
 ioAGCTUk.mRaVPMjm_J8DJk2T1rzVJEpHa1RY0n_sSKkGtb2HHa7ppESgvM1n6uG6agHY9YLkqjX
 kzpoQIPZAKoh5gK4lzn5Vmj1ea6AgP3qsAlHJofplecT_YwJN6yrPkVc7DO2yn.xm5XNihatoWaD
 ZtdzTsEqSkbqutCiRrOWMvaR08..XoC_CPdPoNmXM68bQm_jhlfvywaAJPnziI5mYvJUdTRHCwBC
 q12MtjdtoZuVF3MJz_I0ZB3PR4q_swaUq.56Pge5fs5rPwXUXs4pLPTLsXLeeuE95mfAHrVBpASj
 ptyOqqDAveJ5x_G83SMR3KRf8NmzBdRcoi3QLtKsOX2dV9ZuLH_HwjpMyKiLWc0QmHb2L7UX5Y3y
 gdCyFEhbwocdu0eGWb6fxUueWgi_bq_VqD09b3nPN7WB9hPlXjNShy4F4b9UIKnKAzDAaAXEgUHz
 FTR3j0GavGnNe5hIA6FCkaxwi4713pFOSvBeFEUpHW8TnYI3rnhraPgcIvnRn4MdUDVcbrKW85fO
 t8Q3K7IYUmBiYy1IvlKKsqd.0CZjHbCvqvg275MHCxjiPm.DjVSr2S8eIeigEOgtUN1Kq2WK5u5H
 eoMZeD7j3jdqk78_D1v7Ro7B5p_Uf5pti1yK_SIkv3qAlHV0aWdTHZaV4Vx3fGx_WRkfnL5USIax
 f284GL0KiSYWXenSB.gd0waPUEKjGAU0T9K_0QJiZ0CgQNXcl2QFTs9ICwwCaxvYnKOMXkfzpCW_
 ld0e3oZqZcu3Q5upxnV68fAA_dpgu2FGH1kY9CRL1j6tLtFryCZI3ehStDuzEr98QCfK4R9HKB_e
 JC7bD.RYlrPrJK6BSmBib7QxzcgQzUaJrPNMU_Gl9fVt0zkSj_s2vn1iQFC7GHThK23M.n3JrKAq
 HxChKxTPi4zb662a8XTik8GeiHfxBlKtjCsO.Pud22DYWhvysL6NZSIAubwunYin4IHgej9JCLdE
 8LM1k7Ru6nQ1SljN5mRcqyz1.zE4ip1_.Px.d84pR5vE3aLy8dSg1Rs.ezNnVwOCs7ucCgQy6aO.
 OgrDzDG4JrzXa68edfY_gE66qefXb0gZTO3z5F4.t0LW_7UE8_59OryS97UfZIM9LLxie9J7O.Uk
 lvJPj5UBYPP.7y06xbTdZZyowUpVSP3aOLz0YCHO56aAomPdyHqfHmg636iXx8FjqCYE2xTkMKU.
 uMBOP0XaXkKnNusSaxw2nuuCcW44coY2v86QbrJccunc4YPxnnJEEIIDUaCM3zw2Zkf7yF96DuPY
 b0xsAeG1aFkfMwF9iV8.qqjuTAmVMeGCGAszgwmaoa9Pu9371tyF_vt6f7DGopRjHqft_9TUDOQY
 995mG5qNu3OyIyo.lm_EMpcHER9IXl64j8Wr.5qTYIGVoRJCtA.zVBevv7POlbjf5CZmLtHs2zis
 ERz8Wy.TISPJtXtpMnFl1J96kFAhuRKNEI49WXOkTVlqSwB2NCNLhTwgbjiMZLk.j8clPb7Vzqjy
 UkCGIcXb_zWWGPYdWcT9olJa3AhEWp4tGFqiyZe45b.olZ8qz1KnzIH99DoQgq7UoKj_KSQ.93iB
 XMjCAgMVzxN7xWDUvtstTr.uM1DlfuEb966UeaGoZWcdMYlhjNZQHv56eByqwOsOelkB2BV.apT7
 JJ_p_1PMbmFeU.GkIk9TPkdExttG2KA9wplrnljdMff4EzjtJX_Wwj7tS2uQI6x7i4yPNrueu1KW
 fbt_Kbcn.WS1NmVNqzsqZDm6d2mx63CRtHf6DEZiIG1s_4BC3wZ4LsMJHANmSZ9F_KAU5qv.Kb18
 RbrHpz0sXEK_eiFlG40xNYqK_CC80yxSBnShpew_PIiVCYPRlL27yS982DXOgl27XhU_Q9La1dx9
 C4CPdB9uG.0e9NHJgln0a5tf_hY3nTE_72WGfvTa87bZrNbqXMMuKUeo6cJ9SS7y_3FBFpKTn4X_
 7PZdj7c15eGG1cFQ_fZ6DNghcazd_bXWK7ZL23vTEdLzLqSmV.CGFrZS_rFgNk6fJfP7t1SqlzR7
 S8gCTphls30OKQfdWu.FxngKmd1pr11uKJdJDtduV1VvI9rK8uGwuA6huqsEIPFsIAeE-
X-Sonic-MF: <abdul.rahim@myyahoo.com>
X-Sonic-ID: 5ddb7eeb-6895-4716-a3fa-549a47eaf98c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.sg3.yahoo.com with HTTP; Sun, 15 Sep 2024 23:52:01 +0000
Received: by hermes--production-sg3-fc85cddf6-6lk5x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4bbec87ee6aafb942a1f782e8b166a4d;
          Sun, 15 Sep 2024 23:41:48 +0000 (UTC)
From: Abdul Rahim <abdul.rahim@myyahoo.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	shuah@kernel.org
Cc: Abdul Rahim <abdul.rahim@myyahoo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kselftest/alsa: add silent flag to reduce noise
Date: Mon, 16 Sep 2024 05:11:30 +0530
Message-ID: <20240915234131.61962-2-abdul.rahim@myyahoo.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20240915234131.61962-2-abdul.rahim.ref@myyahoo.com>

When ALSA is not installed on the users system, the error:

"Package alsa was not found in the pkg-config search path.
Perhaps you should add the directory containing `alsa.pc'
to the PKG_CONFIG_PATH environment variable
Package 'alsa', required by 'virtual:world', not found"

is printed 3 times, which generates unnecessary noise.
Hence, Remove unnecessary noise using `--silence-errors` on LDLIBS
assignment, so the message is printed only once.

Signed-off-by: Abdul Rahim <abdul.rahim@myyahoo.com>
---
 tools/testing/selftests/alsa/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
index 25be68025290..cd022fc869fb 100644
--- a/tools/testing/selftests/alsa/Makefile
+++ b/tools/testing/selftests/alsa/Makefile
@@ -2,7 +2,7 @@
 #
 
 CFLAGS += $(shell pkg-config --cflags alsa) $(KHDR_INCLUDES)
-LDLIBS += $(shell pkg-config --libs alsa)
+LDLIBS += $(shell pkg-config --silence-errors --libs alsa)
 ifeq ($(LDLIBS),)
 LDLIBS += -lasound
 endif
-- 
2.46.0

