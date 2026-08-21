Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBF6474246;
	Fri, 21 Aug 2026 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317246; cv=none; b=rskiI6FOUCLf/oEY6ITbakO8Um1/Z1YN0lVRD6ZeBCSMRl0YLL+PLTz0dyh0qbogBtV5eooAMW5Yh4tEZCBMzTr5CzfIqvWZsNyDsl8A9sNSAgvS0chA8bKHkjfaznlf+MHrcXg84003FwUehDHgxWK1ArjXqblMB7vP5+I1xKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317246; c=relaxed/simple;
	bh=EiKXbkjaOo3VXfn8CpBZf7bVGkTe+X3yii+qJ3ikTtc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=rC0hVUzH0fRZQPv6ouOtiW7jeBXlxQP0ISzvhfRTsKBMZnloNyNYPUCs13Y/Z47g4ww+uPU9D93ZxQrfEx4TpWZAScGsTkhJOOtVcmo1wNOuVYAhzcnoDG98n2NivjsySEmcNWc86VzzHZeRY6AtFqN9XA8kOfEpx+9E6fW1GKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WZWX/9/J; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WZWX/9/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787317224; x=1787922024; i=markus.elfring@web.de;
	bh=hZ45cGf8E/zq9OBWMw+HRJzmZCfsSE3ej5IczVFPwY8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WZWX/9/J6VnVjyLTVf0swhPcb4+rVQIyCw1tbZVC4LDZQuS+w28/woTuHEtrR7P8
	 UP4EZXmUqYtjeRYCnMiowBG4RM3VNTpQ1qr0+xMDCjFV6Js2ECeqF8I+25ZMJB9Ar
	 LquxIlsi0n+9Dlqg/vUYBfCAxxANaNrcnJhK49k/SH5Ja8fD6w4euTwktPr+KTAVR
	 yWDsyx7pbTsodTOedsuhNvMrZZpvcQqOYQvLFjtSYCrC+1b9Pqz0zP72XRKLja3O+
	 FtVwn2H0y30fyb/VZmKDM+Gsk1hUKF2dY9hVb/03JP7fohKX7pkod8h7Xl87B/AyP
	 paSN835Nvl05KHWyhA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MXGK4-1xRckY1JHS-00TLrZ; Fri, 21
 Aug 2026 15:00:24 +0200
Message-ID: <040bab74-5f8c-4054-9b93-4a5e9845d4f8@web.de>
Date: Fri, 21 Aug 2026 15:00:22 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260820083646.11383-2-nicholas.johnson-opensource@outlook.com.au>
Subject: Re: [RFC PATCH] ALSA: pci: add PreSonus Quantum PCI driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260820083646.11383-2-nicholas.johnson-opensource@outlook.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1tfczgyvRL8GdLiflP1tPZpFLO58rR7BtUOZB/AmNxcsFJdaxjZ
 x9bcl54NdE4pI3x6Qu4xprIq8TcWws0ScuyFKBRleiLQk6cLPRr78PaAVrGaotJQ7VLcmiV
 9vIh4ZKJ0Nf+RAzqajmwGu0lbeU4LM0QSZQ9vKFRGr7q0D2BX/9twCsN0T6eCrS9KXSC6q4
 I47cGm4mUcCqWzjzn6wXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RW4pkZZzNYY=;Fr9QEr8fU3KJnjhjk3IHgxBItSq
 uHp6W4cAxSNWOzLdYciVg3CugIz2+u1hrWgmeXcX11lM/KuJZVlewmyet1Fx71Z7rqZzzFGez
 luRMB1JmnSBYyxPabt5aVlt2jlVlVswO6TjahCihEgqWHz6IiOGzPMkGvywKW7KTHQwRSQgjW
 jUqKHbd1MqrmPQ10rXJ+ZqibVl5Vz+1DfeNgcgXwdD5uT6TCIUKvfshT8lvoj+VSL4hb6XwZm
 qocYCfq9A4ajj20s/4HLF0FK6+63ufPS/0NG7u8o9Xm6CpiD6c5Xyz7OlbccX1DVQTWFBMBtx
 7ZS8V2aREydorqMm/WEoXEYqWamA/fJXlL38PujbVY1mQ/uCbsWzDwZjAm3sK6bbHW8H70Oby
 4t9kSNweZ+UpG33HjrByc+3o8KO76D3hib8CTQzx0JOENk+aBh6kgFv1ds2eZaND2HB5foNr9
 4U7thEPI3fFfvD5xpQmtsIjFGeHsqkqWVoib6FNEXAPQvS2k9+0JbT1j50K/WoLTuNl9wQ3eL
 FBVbzIKDfARk9MHUMcH/+lR8OEcnjI4yp+WaOW6zdDgZvKXasR8PqHDJxn+TDbBGNmabgiw9d
 fJRMsNl7vRsoQoQ8uZFRj3ifeNfEdgL+nGhjUa9oDyDpH+qxA9MR8Fhcfq0ylbnxe2RD4vVP5
 yhnodbMUTvg9zvMZjHezk2/4T4hbi/5VAEtDAWKWr3/CYW5Y+L/SLCJXczWfxKsYO6dkyjOLI
 6NnaOIGHfZIRFRUjEt5yJ5d0P5F917tfeWJh0LsRfBUpzBJejgGLTVQE7P3I7IRLOI63G9zUI
 bLHTu4t6KvRxuRpIdLqqwGELRtM6jj0g+z+TdLFgJ5SIZsxo5Wz4om7XwfxZO3fRO1vbXP5Im
 8/2Pp8FWOg0cJh49vafy547OucBn5GYFYA34s9bAc85odST9hBaS9TJvDkKzR89kpKiwVZ7EB
 K9rF+a8xU/kkEo/3m8anPNs9ZpVK5mfHMNGe1mXttfS1T4A9Bqd451KHYVj01WXWDd6mazvRr
 geeiIgrUzzr3o4nEnXXP5U/4mL/IVMt/x+6CdwzwA3k0NzZXRzgLoVG+AjcFW76KaxsK45aAB
 YiN8O0Vtjq1Y78BJ6gTkPseoDE/4Qzk59kEbCZET9DlganE4WqGYLSAkLNspB68ZGkogYpsQ5
 cynOAzBiharKQ1d6YnlHplETRHI1A7rPLOC027XRk6Xos9AAoHPKQuql8YEEU5uluWiKxcDRa
 IMUv9PQps59pFyAFsmpW/OY1PcME2AIn4XdYxWT0ixkqeMKueq18rqFI3imvzUCYzPMCp4OfX
 BgDrsyx+doCV2W1AhuMDtntAhrVDJMaUuSX8ByMMPNkg6/NvVfqSvtcTAsBX8J88pbsikxmCj
 0JPEWNnJ8dHswFGh9pF+ymThJFyI52glyEedk/Wvsu5t7/P503Mdyqc2d11/HAl77xTHuJgnm
 b2rEmucOAwaHuFe5wlxeqLWH4YWW73f7I4t0s+7+/twAq256B25VJAFob2n7ChdAI27yNr7tY
 sV/cn7yVZzIDdS3y/FX3UCWkAPp+YZxMQ5XDu5XpGR40JsDPOfF55kH2wD3+jrhpWA66Ky9bp
 4zDLqUdMjk9GsTAyapBLI4BojcFp8EvvzMz8JaiMf7Fc93I90sVm+yAzqpfTmIW4F0eXee7KL
 M8blNACnW/vABsYnJKRNafSSAgwBknSD1H2R9NBFn6dM6aB2Zr3iwYEVqK06WkIDGr9Dbf1MF
 htsJfhaxxSgDmfqnWOmsj3cPXGJXAWySXe9Iau5Q+Zuca+jZy166/X67aT8HNVSfh0aFT7JLB
 M0t/cqPesZAV2/gfCtfSHjn1ejR0s+lTH33HWTS4sxrrymJEI7AS7PGOSI0ZVimUWevvH2qwH
 NmaNnGSZsACY4Yhk11wtTMyxDQ2o0Q9CVo/qNom6nNhOjejdGJesx3ORElMPDzPzXyUcvfa80
 JCUDdN2WWUXFka+vcYOrboQq8QMZf3d9FjKwcFo4p1N9gMGbmhzH12oF9HVsJ610xIkEehjuR
 aA9mooU3c1GxiBIGYnrBbz1L9gyG66NRl7Gq86vydkORaBlo7BcNlFAOFtTABwWdsgiG4bqkW
 CvY5GYjWPmJzIreapxx9OlzNOCWUGdXwe0L+M4bfYtzZ+W3/zbN/WCd94Lilm9ODGQnN29GqO
 QFLZ+sveBypHT6XnObvX60iIUANPELcYyj1EeoQAQsqnFJeMAjD3U2pSoT70c/xCJmBprKly3
 dcerdK+FFKeIrMUOHzLiGNztQ9o8A69u4jtJn47cRbUZXSPp1oTM5ZHwRpatIWJScc7n0IO94
 T3sZ0sduU154mpguceD7nqYeSoIkycK7IXDH4uSoVoeF1lpiAUB8oCkYNv1xpGxaoMiq7CbTu
 LB1zl0sZykY1JwlJ6sWDwzxfcj7AvrgL82bVv5cURyNLjgt2D/ssiVGhUhJbScmyjXV3tWn9t
 ow0Amyd+FxZu6zcT82ftxKQ++e5/xWpBJutypOjDGv40iv9nfbYpQ+BwWUbUNZU7O700+gbmk
 n21UWK49W0un15cWtBcxRADF1zpH4wEq1UjP3GBmk26UYlcAMeBB9oDhtKbkF+6ZWPaPvSGn3
 Bbu3UBiSq2rMGHi0op1w4G9UQts8YIua7YfBM0mfBKwJ5E9FG/4fbG0HH+dwwPzJXt+1X/cb9
 MarSqYUGV9yHxpiXSLifBcg2yfue7h6BxgEwhrSZoa91s1j52G3IVdNxteJ+tn5GZJe15iG3s
 R8MuT2Zm3MrFDsCyVfPKQrTlYNCjIniWa0SphXsqDSrbtADDlGj5VcruF0vibkUZGByA/p2om
 1YQALJlIn7siwBXK/QFNsRbPoq4g4zyRVgKEJd7B8oGoeG7N6XKFkrZaz9d5QdxyMJ5gAMGmi
 MNTPEqRy/JYqCoZNTmzKb3KoTXtD0DycxEmHiHlQ8mdA/2aMA6fp+RmMjgoRHsoDWhXf0Pgcb
 DelQ4QG0zzy/ZyIEaSZ5RhmpCDY2VtFKdaDVbtkzz/cQqkUzbZiB9yHa1F7+fnZ0MqWypJjlD
 arGWDwMv1X/v27T7qx0AodhCl9ZSTMmK+T8SnyCBs7N1iHzdJS1mLswYkHke/ZLcgzH9rX3xQ
 geUWlYKWJC4WoBtbOQc43NKy8vt5x3L0bTLQrpP6FMuXrB7/Z+GBmutl6a64/e89cAM+pPmdU
 a9wrma/7da/h87teCxH0os2Sv00gynSZs4+M9jD76cZl+I3pTT3lmThRgyFjx9D+xP+0tX9cu
 Et/UggIoT4cPKzk0nzsL6VqVPKJ0oOtTkDVuIFSJQblrpRd1w1WuEYLgdX60AQkvJ/m+GDTTz
 ufgU5mRY2a0CZpxzD2rOtDa+hfsq1VCsCeyko4i6Nq5cBYUcggyYhc60aUHGtjc6BWddCJXJU
 97XjtVww+hkjrHfS3FtpNIN3FPnnDEcgDVfNT57eENgsuwLxmgOluUXgyHOpaAug+XQNj8KX8
 w63leP4hmujGAfJo9Ah9xUACYKftE7gJDlfX/b+lWubDbrUkjG/8mzM939ICss1AaRYeoRfvI
 JY5rMOlYnifwoYAJougFQolN89+ur8/Zx8KY77BOAxIB1JJ5Z1jA1VT3g4HwSVZU6Pr65/wxS
 +cGkRCExscDNCPIyjZmpyS/LWKX3YLrc/Y0WwV+82U6rBiX2zIAriRn5biFGwCha1kCUyNYKj
 X28xHHuw3gTOmVxi3jLK7e5q8s7ZUPpgVgGXTjwJIxa+qQMfb2YPK9LBsopg30KpVcjPqJFkm
 vzDZJBK3O3JIB5gney7wMglp5jUegeU+A8VMP0QuhT8FJ61VfWLwXLjiu8xVDcl2lvZrTmrXm
 tJgKHTmtWYIn4cREV0REVLMpDyuk04JddTLsuY+p8x/HiBY54wvgxCRNxfounzY2J5eYJsqzI
 EIIFv8++CANoIRvZgbqG5cspf1UJ0CdSAXBKQ7CibZInrEzTNz/ixfS9yGJ0hzZGQn4nLPdIv
 wd281iUwddtJI6TSbsW3AXPd+hVX0RshU0HuRddmQ2tuXDeCH3wVE0j7j14MHXcJIAFLAOAq4
 116WD7gKwK90QBN9iAQe/Q2utZcvorJ8hv9KWK4vAC1QgZ+wfzDglUXu+xBvyApQ29rW4alC4
 mPKNsn+cbAejg92iaTpslII/kPZZgHmCu1Z4jwoqi4N8Ixpni2Uaqeg5wJKIbQdqITBbUywu2
 2CUtW/aXFBt+xPBBtR3HZGD+9qk4yW6M052QZAiFADhjryu4NUWfe3PbpJbg4JnnP3Xa/WXTT
 KshnS7kREWjYwgj4I1rxoZtV1iQPdID6dwDLddewLMy2+GTbUGB7aouGN7eASEGgVkpOeFwb+
 mDnkFRUI+QYRLX+l1v1rYu5Bb0eQTTckMwT6xxPyUaf7AOnA0xSuq2Cp7r5ccWCwN4DWPftNM
 BaqdaXmya5DdLBNdAIpUA/77ttkh6FyoUAPABMvyTs9HMWrfoZBWzwZ1EAyy2h/8P5SV5tPwU
 MiFKSjQm7Jf3npoCj01Hvb5hlJVD/UVMa1CU0zAVHK5p2qI4xkpqsYI0OrJaZQwuIj0I9iPq1
 ++w6M0I6Pnu2EieO3hdJzVRHWgnuoMyhPMiFh+VEiBUQcuCHIGo8utTtG1qB4LhfS6MHVLN/G
 XgKZJBMm6iDzmrvgJ/1x8yDRlWJPx8TSNtuH0Fn30g15nZlILnWyCFHA7J75o7vz/b8tf7OAa
 V7LxKT5PD10xGU48E6iYhMXpw+2+kxT7OT+DqsePH4LwYdkqrsuiEfGle/vsFlQT6H3spzXKs
 NjznVOaysaHGQHHD2Wmq61UVeFkhEP6TKYzVLbPaeb9H5QEyZ1q9tNRn52RWPLnlh7TK/Ksnn
 RGPIk49nvVEQTFY1FQQtbe8W0hzQRoBVFU0Sy7uSGQcsEg/hcplNeSf9Sk/UWKUg6G31XhFOE
 NdBQDbtnryndY4UTRYF6Zt2gdnEr9sMF8Zi+fJO05lmYSvegj7gQQklPtuv7AzQcrGMyDu2wP
 BWfvbL7cfhF3qsFjgb5toyujDC7MBm1FbDmXNmOC+gRj0pP+4HG8Is8Cdu2s1NQLtHnmc/a11
 S5RkLbiODEZp4uqQtAMqasGf4YtrBwCTJxE7dzBoOWJMQlHPpFGaqCanll5ZKodI5OofLyn+B
 uISjscd9HNdCHCQjNds2yPqaV0g45jkafmYIzGSDvYATld5vwqYvw5AVsjlbVyXrD3zHblzpY
 nzKercjUefG/3vmpchUa+4Rd+dEyjyhO0j8VlJPBISMz/1b02gzEUcD3GxuRiXVG3DGX7U6zf
 rr4FKxJ52YucMaQfjF/3GwQE6x0gGT56RZkJbA5TnxmY89oaZUCMx7znNjB1GWbw8NVI9sxKz
 2It7sLOCB6/BL3YMxJvsAA7eibewLrGhjiHRnPsAL385gEJXdeTXPF8Xk3UpoAYbJUmiTZufs
 W8cKAgqfuVYUKQZd0y/ja+Ihc8Til4epRP3adjqF772Bis6B0j824sAOopmPyveUsC7U44J1g
 VXAywRAZvgZcCnKzIa5rNp1grzd4kOgURyMPSboFQJWf9AWvauNa+xQF/EVgN1MdiuMkdDQD8
 EuPgpp4mai+Rxw+ZcAUuNpCzpwFW94VEZh63NeR2ErLVEZVCc1AcRLmVnYzOUYn9bPIcdJ93V
 zVv15jLmhl0C+IJVZ3cYiv7Q2svu7NzueEDal8bCltmXc31W/U7VQ51BCgkM9NYG9IjRXX9f0
 XD6su0cvx7gxzQRuiBZcR/rwtWw1wqsYcP0D2YJiLGZ0vdzj1CwNVZT84kJJZhIuqNofVWnmv
 nuu8CdZKj0t28vEQ9yJOgppuT7YXg2DN3Q4YR2v6y/FGGCZOk1vFcGpcUhn90fPYS3Xg2cmnN
 1Ke/3x9Yr9VXiDsffzfu/GDpsokvjU2bLaIg166KYW9Tfi5ndKh1wmF5T90jZLftNc4nN57sA
 NdcvIx7fY73Or+fIKV/y5esw7yacss0LvcETNGUjxZjaXqsbAioOLmPC6mCNTbh3Tdvdx9vGx
 mCDRsmZzlLkpbCWw1HFWswBqtvj7rEMsLKpPqZEgpXQumzg79see4BR6MhL71aR2lAT99qU5q
 jeghPU6RcwadKXy5hUakQMWT2V/VEPmEfpTR3cyu7bInnzd+MrdNkM1mxMR6UT89Ez54mABXd
 ZaU1yTiCS4OdpbmweiCyOQYa5CTat98XVMpbZB/nNgPDM3skkZQlBzD/+JuU2I/QgwGu9DbTI
 oVcSa2LGXJvmFeQS6SBqSbQdNW9fR9/ykGnHgnRTzvD3E+GoRweDCp4laHml/6hNl841LAn0E
 V4K83/2zrzxmPVx0DRzrh2h9wmPk7IU/1pa3QSCTMjaONgkeKpiqhBkslHo7cocsoqoeSo/rS
 WWnIkAtj/QyNoMQcLyfkC6eJd/oVzAUs4fdDREXUZkOkp19+5/R6CiDyw/Br8eptqf1+68fdp
 Wb22TLvutziOqzPoDWKKMxtfddCULlQuR5TY6C8mIi7btjwvhHQ2kfC7c4BRJkExycNoKFycX
 PIFVnzd9QhfSMhZhdKg/3AYs1VQT5gbrT46UZ1nxM8Bdq3893DqsYtQfPT3tZYib0qubOQyp2
 yiD8pO1BC53eRQhi9X+T9I8GF13hSE1QDwF31UGod3m4WJyznQ

=E2=80=A6
> +++ b/sound/pci/quantum/quantum.h
> @@ -0,0 +1,394 @@
=E2=80=A6
> +/* TCI_CHAN_CTRL */
> +#define TCI_CTRL_GET_SAMPLE_RATE    0x31
> +#define TCI_CTRL_SET_SAMPLE_RATE    0x32
> +#define TCI_CTRL_GET_CLOCK_SOURCE   0x33
=E2=80=A6

Would you like to replace more defines for constant values by enumerations
to stress their relationships?

Regards,
Markus
